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

  ESTADO_FACTURA_PTE_EMITIR     = 'Pendiente de emitir'
  ESTADO_FACTURA_GEN_CON_ERROR  = 'Generada (con errores)'
  ESTADO_FACTURA_EMITIDA        = 'Emitida'


  FECHA_INICIO  = 'fecha_inicio'
  FECHA_FIN     = 'fecha_fin'
  FORMATO_FECHA_YYYY_MM_DD = '%Y-%m-%d'
  FACTURAS_GENERADAS = 'facturas_generadas'
  FACTURAS_INCORRECTAS = 'facturas_incorrectas'

  # METODOS

  def generar_facturacion(periodo, anho)
    # todo Obtenemos los contratos en vigor
    contratos = get_contratos_mocks

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

      if !existe_factura(contrato, fecha_inicio, fecha_fin)

        # Si no existe factura para el contrato en el periodo indicado la generamos
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

  # Genera una factura para el contrato y para el periodo indicado en las fechas
  def generar_factura (contrato, periodo, anho)


    errores = false
    importe = 0
    trazas = []
    lineas = []
    id_factura = 1 # factura.id_factura
    num_linea = 0

    domiciliacion = obtener_domiciliacion_por_contrato(contrato)

    contrato.servicios_contratados.each{|servicio_contratado|

      lectura_lectura = 'N/A'

      # LINEAS DE FACTURA
      if servicio_contratado.tipo_servicio.nombre == 'AGUA'
        # FACTURAMOS EL AGUA
        trazas << "Facturando servicio de aguas: #{servicio_contratado.tipo_servicio.nombre}"
        lectura = obtener_lectura_actual(contrato)
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
          periodo: convertir_a_periodo_db(periodo, anho),
          lectura: lectura_lectura
      )

      lineas << linea

    }


    estado_factura = errores ? ESTADO_FACTURA_GEN_CON_ERROR : ESTADO_FACTURA_PTE_EMITIR


    factura = Factura.new(
        descripcion: 'factura creada a partir de un mock',   #todo que se mete en la descripcion
        fecha_generacion: obtener_fecha_inicio(periodo, anho),
        estado: estado_factura,
        detalle_facturacion: trazas.to_s,
        nombre_cliente: contrato.abonado.nombre + ' ' + contrato.abonado.apellidos,
        direccion: 'no esta hecho',     # todo que direccion se mete aqui (la del inmueble, la del abonado, la de la domiciliacion)
        codigo_postal: 55555,           # todo la misma duda que para la direccion
        provincia: 'no esta hecho',     # todo la misma duda que para la direccion
        banco: 'falta este campo',      # todo en la entidad domiciliacion falta un campo banco
        numero_cuenta: domiciliacion.ccc,
        linea_facturas: lineas
    )




    [factura, errores]
  end

  def obtener_lectura_actual(contrato)
    #todo falta el metodo de abajo
    #inmueble = obtener_inmueble_por_contrato(contrato.id)
    inmueble = InmuebleMock.new(1, contrato)
    #todo falta el metodo de abajo
    #contador = obtener_contador_por_inmueble(inmueble.id)
    contador = ContadorMock.new(1, inmueble)
    #todo falta el metodo de abajo
    #lectura = obtener_ultima_lectura_por_contador(contador.id)
    lectura = LecturaMock.new(1, 1000, nil, nil, 900, contador)
  end

  def obtener_tarifa_actual_por_tipo_tarifa(tipo_tarifa)
    # todo hay que seleccionar la tarifa actual
    tarifa = TarifaMock.new(1, 500, Time.local(2012, 1, 1), Time.local(2016, 1, 1), tipo_tarifa)
  end

  def existe_factura(contrato, fecha_inicio, fecha_fin)
    # todo falta meter la relacion contrato dentro de factura y filtrar por contrato (una factura tiene un contrato)
    # Factura.where(:fecha_generacion => fecha_inicio..fecha_fin).where(:contrato == contrato.id).any?
    Factura.where(:fecha_generacion => fecha_inicio..fecha_fin).any?
  end

  def obtener_domiciliacion_por_contrato(contrato)
    #Creamos una domiciliacion para el contrato
    fecha_actual = Date.today
    #todo Domiciliacion.where(:contrato == contrato).where(:fecha_inicio >= fecha_actual and :fecha_fin <= fecha_actual)
    domiciliacion = DomiciliacionMock.new(1, '2080 1234 35 0123456789', 'Nombre Titular Cuenta', 'Direccion de la domicialicion?', 555555555, '1245678P', contrato)
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



  ########################################################
  # MOCKS
  ########################################################
  class ContratoMock
    attr_accessor :id
    attr_accessor :nombre
    attr_accessor :fecha_inicio		# almacenamos objetos de tipo Time y en la columna de bd usamos timestamp
    attr_accessor :fecha_fin		# almacenamos objetos de tipo Time y en la columna de bd usamos timestamp
    attr_accessor :servicios_contratados
    attr_accessor :abonado

    # Crear el objeto
    def initialize(id, nombre, fecha_inicio, fecha_fin, servicios_contratados, abonado)
      @id = id
      @nombre = nombre
      @fecha_inicio = fecha_inicio
      @fecha_fin = fecha_fin
      @servicios_contratados = servicios_contratados
      @abonado = abonado
    end
  end

  class ServicioContratadoMock
    attr_accessor :id
    attr_accessor :tipo_servicio
    attr_accessor :tipo_tarifa

    # Crear el objeto
    def initialize(id, tipo_servicio, tipo_tarifa)
      @id = id
      @tipo_servicio = tipo_servicio
      @tipo_tarifa = tipo_tarifa
    end
  end

  class TipoServicioMock
    attr_accessor :id
    attr_accessor :nombre

    # Crear el objeto
    def initialize(id, nombre)
      @id = id
      @nombre = nombre
    end
  end

  class TipoTarifaMock
    attr_accessor :id
    attr_accessor :nombre

    # Crear el objeto
    def initialize(id, nombre)
      @id = id
      @nombre = nombre
    end
  end

  class TarifaMock
    attr_accessor :id
    attr_accessor :precio
    attr_accessor :fecha_inicio
    attr_accessor :fecha_fin
    attr_accessor :tipo_tarifa

    # Crear el objeto
    def initialize(id, precio, fecha_inicio, fecha_fin, tipo_tarifa)
      @id = id
      @precio = precio
      @fecha_inicio = fecha_inicio
      @fecha_fin = fecha_fin
      @tipo_tarifa = tipo_tarifa
    end

  end

  class InmuebleMock
    attr_accessor :id
    attr_accessor :contrato

    # Crear el objeto
    def initialize(id, contrato)
      @id = id
      @contrato = contrato
    end
  end

  class ContadorMock
    attr_accessor :id
    attr_accessor :inmueble

    # Crear el objeto
    def initialize(id, inmueble)
      @id = id
      @inmueble = inmueble
    end
  end

  class LecturaMock
    attr_accessor :id
    attr_accessor :lectura
    attr_accessor :incidencia
    attr_accessor :fecha
    attr_accessor :lectura_anterior
    attr_accessor :contador

    # Crear el objeto
    def initialize(id, lectura, incidencia, fecha, lectura_anterior, contador)
      @id = id
      @lectura = lectura
      @incidencia = incidencia
      @fecha = fecha
      @lectura_anterior = lectura_anterior
      @contador = contador
    end
  end

  class IncidenciaMock
    attr_accessor :id
    attr_accessor :descripcion

    # Crear el objeto
    def initialize(id, descripcion)
      @id = id
      @descripcion = descripcion
    end
  end

  class AbonadoMock
    attr_accessor :id
    attr_accessor :nombre
    attr_accessor :apellidos
    attr_accessor :razon_social
    attr_accessor :nif

    # Crear el objeto
    def initialize(id, nombre, apellidos, razon_social, nif)
      @id = id
      @nombre = nombre
      @apellidos = apellidos
      @razon_social = razon_social
      @nif = nif
    end
  end

  class DomiciliacionMock
    attr_accessor :id
    attr_accessor :ccc
    attr_accessor :titular
    attr_accessor :direccion
    attr_accessor :telefono
    attr_accessor :nif
    attr_accessor :contrato

    # Crear el objeto
    def initialize(id, ccc, titular, direccion, telefono, nif, contrato)
      @id = id
      @ccc = ccc
      @titular = titular
      @direccion = direccion
      @telefono = telefono
      @nif = nif
      @contrato = contrato
    end
  end


  def get_contratos_mocks

    #Creamos el abonado
    abonado = AbonadoMock.new(1, 'Juan Carlos', 'Eiras Nieto', 'Chapuzas S.L.', '44819184P')

    # Creamos tarifas
    tipo_tarifa_agua = TipoTarifaMock.new(1, 'Tarifa para el agua')
    tipo_tarifa_basura = TipoTarifaMock.new(2, 'Tarifa para la basura')


    # Creamos los tipos de servicio
    tipo_servicio_agua = TipoServicioMock.new(1, 'AGUA')
    tipo_servicio_basura = TipoServicioMock.new(2, 'BASURA')

    # Creamos los servicios contratados
    servicio_contratado_agua = ServicioContratadoMock.new(1, tipo_servicio_agua, tipo_tarifa_agua)
    servicio_contratado_basura = ServicioContratadoMock.new(2, tipo_servicio_basura, tipo_tarifa_basura)


    # Creamos contrato
    contrato = ContratoMock.new(1, 'el contrato numero 1', Time.local(2012, 1, 1), Time.local(2015, 1, 1),
                                [servicio_contratado_agua, servicio_contratado_basura], abonado)



    contratos = [contrato]
  end


end
