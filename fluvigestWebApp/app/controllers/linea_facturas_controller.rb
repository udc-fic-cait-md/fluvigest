class LineaFacturasController < ApplicationController
  before_action :set_linea_factura, only: [:show, :edit, :update, :destroy]

  # GET /linea_facturas
  # GET /linea_facturas.json
  def index
    @linea_facturas = LineaFactura.all
    #@linea_facturas = @linea_facturas.paginate(:page => params[:page], :per_page => 6)
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
    #@factura = Factura.find(params[:factura_id])
    @factura = Factura.find(@linea_factura.factura)
    @factura = Factura.find(@linea_factura.factura)
  end

  # POST /linea_facturas
  # POST /linea_facturas.json
  def create
    @factura = Factura.find(session[:id_factura])
    @linea_factura = @factura.linea_facturas.create(params[:linea_factura].permit(:descripcion, :importe, :lectura))
    @linea_factura.numero = getLastNum(@linea_factura.factura_id)
    @linea_factura.save
    redirect_to factura_path(@factura)
  end


  # PATCH/PUT /linea_facturas/1
  # PATCH/PUT /linea_facturas/1.json
  def update
    @factura = Factura.find(@linea_factura.factura)
    @linea_factura.update(linea_factura_params)
    redirect_to factura_path(@factura)
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
      params.require(:linea_factura).permit(:factura_id, :numero, :descripcion, :importe, :lectura)
    end

  #Función que me devuelve el ultimo numero de linea usado.
  def getLastNum(factura_id)
    count = LineaFactura.maximum(:numero, :conditions => ["factura_id = ?", factura_id] )
    if count == nil then
      count = 1
    else
      count = count + 1
    end
  end
end
