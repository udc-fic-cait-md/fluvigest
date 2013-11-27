class TipoTarifasController < ApplicationController
  before_action :set_tipo_tarifa, only: [:show, :edit, :update, :destroy]

  # GET /tipo_tarifas
  # GET /tipo_tarifas.json
  def index
    @tipo_tarifas = TipoTarifa.all
  end

  # GET /tipo_tarifas/1
  # GET /tipo_tarifas/1.json
  def show
    @tipo_tarifa=TipoTarifa.find(params[:id])
    @tarifas=Tarifa.where(:tipo_tarifa_id => params[:id])
  end

  # GET /tipo_tarifas/new
  def new
    @tipo_tarifa = TipoTarifa.new
  end

  # GET /tipo_tarifas/1/edit
  def edit
  end

  # POST /tipo_tarifas
  # POST /tipo_tarifas.json
  def create
    @tipo_tarifa = TipoTarifa.new(tipo_tarifa_params)

    respond_to do |format|
      if @tipo_tarifa.save
        format.html { redirect_to @tipo_tarifa, notice: 'El tipo de tarifa ha sido creado satisfactoriamente.' }
        format.json { render action: 'show', status: :created, location: @tipo_tarifa }
      else
        format.html { render action: 'new' }
        format.json { render json: @tipo_tarifa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_tarifas/1
  # PATCH/PUT /tipo_tarifas/1.json
  def update
    respond_to do |format|
      if @tipo_tarifa.update(tipo_tarifa_params)
        format.html { redirect_to @tipo_tarifa, notice: 'El tipo de tarifa ha sido actualizado satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tipo_tarifa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_tarifas/1
  # DELETE /tipo_tarifas/1.json
  def destroy
    @tipo_tarifa.destroy
    respond_to do |format|
      format.html { redirect_to tipo_tarifas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_tarifa
      @tipo_tarifa = TipoTarifa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_tarifa_params
      #params[:tipo_tarifa]
      params.require(:tipo_tarifa).permit(:nombre,:descripcion,:tipo_servicio_id)
    end

end
