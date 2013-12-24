module FacturasHelper

  require 'date'

  # CONSTANTES

  MESES_NOMBRES = [
      nil,       # es necesario para poder referenciar a los meses por su numero
      'ENERO',
      'FEBRERO',
      'MARZO',
      'ABRIL',
      'MAYO',
      'JUNIO',
      'JULIO',
      'AGOSTO',
      'SEPTIEMBRE',
      'OCTUBRE',
      'NOVIEMBRE',
      'DICIEMBRE'
  ]

  PERIODOS_FACTURACION = [
      MESES_NOMBRES[1] + '-' + MESES_NOMBRES[2],
      MESES_NOMBRES[3] + '-' + MESES_NOMBRES[4],
      MESES_NOMBRES[5] + '-' + MESES_NOMBRES[6],
      MESES_NOMBRES[7] + '-' + MESES_NOMBRES[8],
      MESES_NOMBRES[9] + '-' + MESES_NOMBRES[10],
      MESES_NOMBRES[11] + '-' + MESES_NOMBRES[12]
  ]

  ESTADOS_FACTURA = [
      'Pendiente de emitir',
      'Generada (con errores)',
      'Emitida'
  ]


  FECHA_INICIO  = 'fecha_inicio'
  FECHA_FIN     = 'fecha_fin'
  FORMATO_FECHA_YYYY_MM_DD = '%Y-%m-%d'
  FACTURAS_GENERADAS = 'facturas_generadas'
  FACTURAS_INCORRECTAS = 'facturas_incorrectas'

  # METODOS

  def generar_facturacion(periodo, anho)

    # Obtenemos los contratos en vigor
    contratos = obtener_contratos_vigentes(obtener_fecha_inicio(periodo, anho), obtener_fecha_fin(periodo, anho))

    resultados = generar_facturacion_contratos(contratos, periodo, anho)

    resultados
  end

  def generar_facturacion_contratos(contratos, periodo, anho)

    resultados = {
        FACTURAS_GENERADAS => 0,
        FACTURAS_INCORRECTAS => 0}


    fecha_inicio = obtener_fecha_inicio(periodo, anho)
    fecha_fin = obtener_fecha_fin(periodo, anho)

    contratos.each{|contrato|

      # Si no existe factura en el periodo para el contrato la generamos
      if !existe_factura(contrato, periodo, anho)

        resultado = generar_factura(contrato, periodo, anho)
        factura = resultado[0]
        errores = resultado[1]


        if !factura.save
        	errores << "No se ha podido crear la factura para el contrato '#{contrato.id}' entre el '#{fecha_inicio.strftime(FORMATO_FECHA_YYYY_MM_DD)}' y el '#{fecha_fin.strftime(FORMATO_FECHA_YYYY_MM_DD)}'."
        else
          resultados[FACTURAS_GENERADAS] = resultados[FACTURAS_GENERADAS] + 1
          if errores
            resultados[FACTURAS_INCORRECTAS] = resultados[FACTURAS_INCORRECTAS] + 1
          end
        end

      end
    }

    return resultados
  end

  # Genera una factura para el contrato y para el periodo indicado
  def generar_factura (contrato, periodo, anho)


    errores = false
    importe = 0
    trazas = []
    lineas = []
    id_factura = 1
    num_linea = 0

    domiciliacion = obtener_domiciliacion(contrato)
    inmueble = obtener_inmueble(contrato)


    servicios_contratados = obtener_servicios_contratados(contrato)
    if(!servicios_contratados.nil?)
      servicios_contratados.each{|servicio_contratado|

      lectura_lectura = 'N/A'

      # LINEAS DE FACTURA
      if servicio_contratado.tipo_servicio.nombre.upcase == 'AGUA'

        # FACTURAMOS EL AGUA
        trazas << "Facturando servicio de aguas: #{servicio_contratado.tipo_servicio.nombre}"

        lectura = obtener_lectura_actual(inmueble)

        if !lectura.nil?
          # hay lectura de agua
          lectura_lectura = lectura.lectura
          trazas << "Lectura contador: #{lectura.lectura}"

          incidencia = lectura.incidencia
          if incidencia.nil?
            # no hay incidencia

            tarifa = obtener_tarifa_actual_por_tipo_tarifa(servicio_contratado.tipo_tarifa)
            if !tarifa.nil?
              # hay tarifa para el servicio
              importe = lectura.lectura * tarifa.precio
              trazas << "Tarifa aplicada: #{tarifa.tipo_tarifa.nombre} (precio litro: #{tarifa.precio}, Importe calculado: #{importe})"
            else
              # no hay tarifa para el servicio -> error
              trazas << 'ERROR: Tarifa no encontrada'
              errores = true
            end
          else
            # hay incidencia
            trazas << "Hay una incidencia asociada a la lectura (IdIncidencia: #{incidencia.id})"
            tarifa_incidencia = incidencia.tarifa
            if !tarifa_incidencia.nil?
              # hay tarifa para la incidencia
              importe = lectura.litros_leidos * tarifa_incidencia.precio
              trazas << "Tarifa incidencia aplicada: #{tarifa_incidencia.nombre} (precio litro: #{tarifa_incidencia.precio}, Importe calculado: #{importe})"
            else
              # no hay tarifa para la incidencia -> error
              trazas << 'ERROR: Tarifa de la incidencia no encontrada'
              errores = true
            end
          end

        else
          # no hay lectura -> error
          trazas << 'ERROR: Lectura no encontrada'
          errores = true
        end
        # FIN FACTURAMOS EL AGUA

      else
        # FACTURAMOS OTROS SERVICIOS
        trazas << "Facturando otro servicio: #{servicio_contratado.tipo_servicio.nombre}"
        tarifa = obtener_tarifa_actual_por_tipo_tarifa(servicio_contratado.tipo_tarifa)
        if !tarifa.nil?
          # hay tarifa para el servicio
          importe = tarifa.precio
          trazas << "Tarifa aplicada: #{tarifa.tipo_tarifa.nombre} (Importe calculado: #{tarifa.precio})"
        else
          # no hay tarifa para el servicio -> error
          trazas << 'ERROR: Tarifa no encontrada'
          errores = true
        end
        # FIN FACTURAMOS OTROS SERVICIOS
      end


      id = 1
      num_linea = num_linea + 1


      linea = LineaFactura.new(
          numero: num_linea,
          descripcion: servicio_contratado.tipo_servicio.nombre,
          importe: importe,
          lectura: lectura_lectura
      )

      lineas << linea

    }
    end


    # Comprobaciones
    esta_domiciliada = !domiciliacion.nil?
    periodo_db = convertir_a_periodo_db(periodo, anho)

    descripcion_factura = contrato.abonado.nil? ? '' : contrato.abonado.nombre + ' ' + contrato.abonado.apellidos + ' ' + periodo_db
    nombre_cliente_factura = ''
    nif_cliente_factura = ''

    if(contrato.abonado.nil?)
      trazas << 'ERROR: Datos del abonado de la factura no encontrados'
      errores = true
    else
      nombre_cliente_factura = contrato.abonado.nombre + ' ' + contrato.abonado.apellidos
      nif_cliente_factura = contrato.abonado.nif
    end

    direccion_factura = ''
    codigo_postal_factura = ''

    if(inmueble.nil?)
      trazas << 'ERROR: Dirección de la factura no encontrado'
      errores = true
    else
      direccion_factura = inmueble.nombre
      codigo_postal_factura = inmueble.cod_postal
    end

    numero_cuenta_factura = ''

    if(esta_domiciliada)
      numero_cuenta_factura = domiciliacion.ccc
    end


    estado_factura = errores ? EstadosFactura::GEN_CON_ERROR : EstadosFactura::PTE_EMITIR

    if(!lineas.nil? && lineas.size > 0)
      factura = Factura.new(
          descripcion: descripcion_factura,
          periodo: periodo_db,
          estado: estado_factura,
          detalle_facturacion: trazas.to_s,
          nombre_cliente: nombre_cliente_factura,
          direccion: direccion_factura,
          codigo_postal: codigo_postal_factura,
          provincia: '',     # TODO no se de donde sacarlo
          banco: '',      #TODO no se de donde sacarlo
          poblacion: '',  #TODO no se de donde sacarlo
          numero_cuenta: numero_cuenta_factura,
          domiciliada: esta_domiciliada,
          dni: nif_cliente_factura,
          contrato: contrato,
          linea_facturas: lineas
      )
    end




    [factura, errores]
  end

  def obtener_lectura_actual(inmueble)

    contador = obtener_contador_por_inmueble(inmueble)

    lectura = obtener_ultima_lectura_por_contador(contador)

  end

  def obtener_inmueble(contrato)

    inmueble = obtener_inmueble_por_contrato(contrato)

  end

  def obtener_tarifa_actual_por_tipo_tarifa(tipo_tarifa)

    tarifa = Tarifa.where(:tipo_tarifa_id => tipo_tarifa.id).last

  end

  def existe_factura(contrato, periodo, anho)

    periodo_db = convertir_a_periodo_db(periodo, anho)
    Factura.where('contrato_id = ? and periodo = ?', contrato.id, periodo_db).any?

  end

  def obtener_domiciliacion(contrato)

    domiciliacion = Domiciliacion.find_by_contrato_id(contrato.id)

  end

  def obtener_servicios_contratados(contrato)

    ServicioContratado.all.where(:contrato_id => contrato)

  end

  def obtener_inmueble_por_contrato(contrato)

    inmueble = Inmueble.find_by_inmueblescol(contrato.id.to_s)

  end

  def obtener_contador_por_inmueble(inmueble)

    contador = Contadore.find_by_inmueble_id(inmueble.id)

  end

  def obtener_ultima_lectura_por_contador(contador)

    lectura = Lectura.where(:contadores_id => contador.id).last

  end

  def obtener_fecha_inicio(periodo, anho)

    Date.new(anho.to_i, MESES_NOMBRES.index(periodo.split('-')[0]), 1)

  end

  def obtener_fecha_fin(periodo, anho)

    Date.new(anho.to_i, MESES_NOMBRES.index(periodo.split('-')[1]), 1).end_of_month

  end

  def convertir_a_periodo_db(periodo, anho)

    periodo + ' ' + anho

  end

  def convertir_a_periodo_modelo(periodo_db)

    trozos = periodo_db.split(' ')
    [trozos[0], trozos[1]]

  end

  def obtener_anhos

    anhos = []
    anho_actual = Date.today.year
    4.times{|i|
      anhos << anho_actual - i
    }
    anhos

  end


  def obtener_contratos_vigentes(fecha_inicio, fecha_fin)

    Contrato.where('fecha_inicio <= ? and fecha_fin >= ?', fecha_fin, fecha_inicio)

  end

  def  show_pdf(numeroFactura)
     Thread.new{Factura_to_PDF.new.crearPDF(numeroFactura)}
	return 'emitida'
  end


end


class EstadosFactura
  PTE_EMITIR     = 0
  GEN_CON_ERROR  = 1
  EMITIDA        = 2
end


class Factura_to_PDF 
    #Gemfile
    #    gem 'pdfkit'
    #    gem 'wkhtmltopdf-binary'
    require 'pdfkit'

    # @param [Integer] numeroFactura identificador de la factura
    def crearPDF(numeroFactura)
      rutaUrl = 'http://localhost:3000/facturas/show_factura?factura_id='
      rutaDestinoPDF= '/tmp'
	    rutaUrlFull = rutaUrl + numeroFactura.to_s

      kit = PDFKit.new(rutaUrlFull)
      kit.to_pdf(rutaDestinoPDF +'/'+ numeroFactura.to_s + '.pdf')
    end
end



