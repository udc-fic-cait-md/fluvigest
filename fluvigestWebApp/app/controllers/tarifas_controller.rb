class TarifasController < ApplicationController
  before_action :set_tarifa, only: [:show, :edit, :update, :destroy]

  # GET /tarifas
  # GET /tarifas.json
  def index
    @tarifas = Tarifa.all
  end

  # GET /tarifas/1
  # GET /tarifas/1.json
  def show
    @tarifa=Tarifa.find(params[:id])
   # TipoTarifa.find(params[:id])
    @tipoTarifa=TipoTarifa.where(["id=?",@tarifa.tipo_tarifa_id]).first_or_create!
  end

  # GET /tarifas/new
  def new
    @tarifa = Tarifa.new
    @tipos=TipoTarifa.all
  end

  # GET /tarifas/1/edit
  def edit
    @tarifa=Tarifa.find(params[:id])
    @tipos=TipoTarifa.all
  end

  # POST /tarifas
  # POST /tarifas.json
  def create
    @tarifa = Tarifa.new(tarifa_params)

    respond_to do |format|
      if @tarifa.save
        format.html { redirect_to @tarifa, notice: 'La tarifa ha sido creada satisfactoriamente.' }
        format.json { render action: 'show', status: :created, location: @tarifa }
      else
        format.html { render action: 'new' }
        format.json { render json: @tarifa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarifas/1
  # PATCH/PUT /tarifas/1.json
  def update
    respond_to do |format|
      if @tarifa.update(tarifa_params)
        format.html { redirect_to @tarifa, notice: 'La tarifa ha sido actualizada satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tarifa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarifas/1
  # DELETE /tarifas/1.json
  def destroy
    @tarifa.destroy
    respond_to do |format|
      format.html { redirect_to tarifas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarifa
      @tarifa = Tarifa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarifa_params
      params.require(:tarifa).permit(:precio,:fecha_inicio,:fecha_fin,:tipo_tarifa_id)
    end
end
