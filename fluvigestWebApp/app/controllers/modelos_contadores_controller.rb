class ModelosContadoresController < ApplicationController
  before_action :set_modelos_contadore, only: [:show, :edit, :update, :destroy]

  # GET /modelos_contadores
  # GET /modelos_contadores.json
  def index
    @modelos_contadores = ModelosContadore.all
  end

  # GET /modelos_contadores/1
  # GET /modelos_contadores/1.json
  def show
  end

  # GET /modelos_contadores/new
  def new
    @modelos_contadore = ModelosContadore.new
  end

  # GET /modelos_contadores/1/edit
  def edit
  end

  # POST /modelos_contadores
  # POST /modelos_contadores.json
  def create
    @modelos_contadore = ModelosContadore.new(modelos_contadore_params)

    respond_to do |format|
      if @modelos_contadore.save
        format.html { redirect_to @modelos_contadore, notice: 'Modelos contadore was successfully created.' }
        format.json { render action: 'show', status: :created, location: @modelos_contadore }
      else
        format.html { render action: 'new' }
        format.json { render json: @modelos_contadore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modelos_contadores/1
  # PATCH/PUT /modelos_contadores/1.json
  def update
    respond_to do |format|
      if @modelos_contadore.update(modelos_contadore_params)
        format.html { redirect_to @modelos_contadore, notice: 'Modelos contadore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @modelos_contadore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modelos_contadores/1
  # DELETE /modelos_contadores/1.json
  def destroy
    @modelos_contadore.destroy
    respond_to do |format|
      format.html { redirect_to modelos_contadores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modelos_contadore
      @modelos_contadore = ModelosContadore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modelos_contadore_params
      params.require(:modelos_contadore).permit(:marca, :modelo)
    end
end
