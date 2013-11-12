class LineaFacturasController < ApplicationController
  before_action :set_linea_factura, only: [:show, :edit, :update, :destroy]

  # GET /linea_facturas
  # GET /linea_facturas.json
  def index
    #@factura = Factura.find(params[:factura_id])
    @linea_facturas = LineaFactura.all
  end

  # GET /linea_facturas/1
  # GET /linea_facturas/1.json
  def show

  end

  # GET /linea_facturas/new
  def new
    @factura = Factura.find(params[:factura_id])
    session[:id_factura] = @factura.id
    @linea_factura = LineaFactura.new
  end

  # GET /linea_facturas/1/edit
  def edit
  end

  # POST /linea_facturas
  # POST /linea_facturas.json
  def create

    @factura = Factura.find(session[:id_factura])
    @linea_factura = @factura.linea_facturas.create(params[:linea_factura].permit(:numero, :descripcion))
    redirect_to factura_path(@factura)

    #@linea_factura = LineaFactura.new(linea_factura_params)

    #respond_to do |format|
     # if @linea_factura.save
      #  format.html { redirect_to @linea_factura, notice: 'Linea factura was successfully created.' }
       # format.json { render action: 'show', status: :created, location: @linea_factura }
      #else
       # format.html { render action: 'new' }
       # format.json { render json: @linea_factura.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PATCH/PUT /linea_facturas/1
  # PATCH/PUT /linea_facturas/1.json
  def update
    #@factura = Factura.find(params[:factura_id])
    #@linea_factura = @factura.linea_facturas.find(params[:id])
    #@linea_factura.update(params[:linea_factura].permit(:numero, :descripcion))
    @factura = Factura.find(@linea_factura.factura)
    @linea_factura.update(linea_factura_params)
    redirect_to factura_path(@factura)
    #respond_to do |format|
      #if @linea_factura.update(linea_factura_params)
       # format.html { redirect_to linea_factura_path }
       # format.json { head :no_content }
      #else
      #  format.html { render action: 'edit' }
      #  format.json { render json: @linea_factura.errors, status: :unprocessable_entity }
     # end
    #end
  end

  def verLineas

  end

  # DELETE /linea_facturas/1
  # DELETE /linea_facturas/1.json
  def destroy
    @factura = Factura.find(params[:factura_id])
    @linea_factura = @factura.linea_facturas.find(params[:id])
    @linea_factura.destroy
    redirect_to factura_path(@factura)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linea_factura
      @linea_factura = LineaFactura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def linea_factura_params
      params.require(:linea_factura).permit(:factura_id, :numero, :descripcion)
    end
end
