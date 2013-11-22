class FacturasController < ApplicationController
  before_action :set_factura, only: [:show, :edit, :update, :destroy]

  include FacturasHelper

  require 'will_paginate'
  require 'will_paginate/array'

  # GET /facturas
  # GET /facturas.json
  def index
    @facturas = Factura.all
    @facturas = @facturas.paginate(:page => params[:page], :per_page => 6)

  end

  # GET /facturas/1
  # GET /facturas/1.json
  def show
    @linea_facturas = @factura.linea_facturas.all
    @linea_facturas = @linea_facturas.paginate(:page => params[:page], :per_page => 6)
  end

  def show_factura
    @factura = Factura.find(params[:factura_id])
    @linea_facturas = @factura.linea_facturas.all
    @total = @factura.linea_facturas.sum('importe')
  end

  # GET /facturas/new
  def new
    @factura = Factura.new
  end

  # GET /facturas/1/edit
  def edit
  end

  # POST /facturas
  # POST /facturas.json
  def create
    @factura = Factura.new(factura_params)

    respond_to do |format|
      if @factura.save
        format.html { redirect_to facturas_path }
        format.json { render action: 'show', status: :created, location: @factura }
      else
        format.html { render action: 'new' }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facturas/1
  # PATCH/PUT /facturas/1.json
  def update
    respond_to do |format|
      if @factura.update(factura_params)
        format.html { redirect_to facturas_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facturas/1
  # DELETE /facturas/1.json
  def destroy
    @factura.destroy
    respond_to do |format|
      format.html { redirect_to facturas_url }
      format.json { head :no_content }
    end
  end

  ##########################
  # GENERACION DE FACTURAS #
  ##########################

  # GET /facturas/generar
  def show_generar
    #@facturas = Factura.all
    #periodo_ = "MARZO-ABRIL"
  end

  # POST /facturas/generar
  def generar
    peri = params[:periodo][0]
    anho = params[:anho][0]
    fecha_inicio = obtener_fecha_inicio(peri, anho)
    fecha_fin = obtener_fecha_fin(peri, anho)
    #@factura = Factura.where(:fecha => fecha_inicio..fecha_fin)

    resultados = generar_facturacion(peri, anho)

    # TODO: hay que formatear las fechas
    @mensaje_facturadas = "Se han generado #{resultados['facturas_generadas']} facturas en el periodo que va " +
        "desde el #{fecha_inicio} hasta el #{fecha_fin}."

    if !resultados['facturas_incorrectas'].nil? && resultados['facturas_incorrectas'] != 0
      @mensaje_error = "Existen #{resultados['facturas_incorrectas']} facturas que se han generado con algún tipo de error. " +
        "Para ver dichas facturas pulse <a href='index?periodo=MARZO-ABRIL&anho=2013&estado=2'>aqu&iacute;</a>."
    end

    render 'show_generar'
  end
  ##############################
  # FIN GENERACION DE FACTURAS #
  ##############################

  ##############################
###### REMESAS #muestra el formulario de busqueda de remesa
  ##############################
  def buscarRemesa
    render 'facturas/buscar-remesa'
  end

 def generarRemesa
	render 'facturas/generacion_remesa'
 end

  # muestra las facturas entre una fecha de inicio y una de fin. Solo las muestra si están domiciliadas y no pertenecen a ninguna remesa
  def listarRemesa
	if params[:codigo_postal].to_i == 0
		@facturas = Factura.where("created_at >= ? AND created_at <= ? AND domiciliada = true AND idRemesa is null", params[:fecha_inicio], params[:fecha_final])
	#@facturas = Factura.find_by_sql("SELECT * FROM Factura WHERE created_at >= ? AND created_at <= ? AND domiciliada = true AND idRemesa = null", params[:fecha_inicio], params[:fecha_final])

	else
      @facturas = Factura.where("created_at >= ? AND created_at <= ? AND codigo_postal = ? AND domiciliada = true AND idRemesa is null", params[:fecha_inicio], params[:fecha_final], params[:codigo_postal])
     end

    render 'facturas/listado-remesas'
  end


  ########################
  # BUSQUEDA DE FACTURAS #
  ########################
  def buscarFactura
    render 'facturas/buscar_factura'
  end


  def listarFactura	

    if params[:dni].to_i == 0
    	@facturas = Factura.where("created_at >= ? AND created_at <= ? AND codigo_postal = ?", params[:fecha_inicio], params[:fecha_final], params[:codigo_postal])

    elsif params[:codigo_postal].to_i == 0
    	@facturas = Factura.where("created_at >= ? AND created_at <= ? AND dni= ?", params[:fecha_inicio], params[:fecha_final], params[:dni])

	else
       @facturas = Factura.where("created_at >= ? AND created_at <= ? AND dni = ? AND codigo_postal = ?", params[:fecha_inicio], params[:fecha_final], params[:dni], params[:codigo_postal])
    end    
    render 'facturas/listado-facturas'
  end
  ############################
  # FIN BUSQUEDA DE FACTURAS #
  ############################


  def emitir
    peri = params[:periodo][0]
    anho = params[:anho][0]
    periodo = peri+" "+anho

    Factura.where(:periodo => periodo, :estado => 0).update_all(:estado => 2, :fecha_emision => Time.now.utc)

    ##no siempre se emiten controlar esto
    @mensaje_emitidas ="Se han emitido las facturas correspondientes al periodo #{periodo}"

    render 'show_emitir'

  end

  #Busqueda para odernar y paginar la tabla de facturas

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factura
      @factura = Factura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factura_params
      params.require(:factura).permit(:descripcion, :fecha_emision)
    end





end
