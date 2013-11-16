class FacturasController < ApplicationController
  before_action :set_factura, only: [:show, :edit, :update, :destroy]
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
