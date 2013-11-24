class ContadoresController < ApplicationController
  before_action :set_contadore, only: [:show, :edit, :update, :destroy]

  # GET /contadores
  # GET /contadores.json
  def index
    @contadores = Contadore.all
  end

  # GET /contadores/1
  # GET /contadores/1.json
  def show
		@modelo = @contadore.modelos_contadore
  end

  # GET /contadores/new
  def new
    @contadore = Contadore.new
  end

  # GET /contadores/1/edit
  def edit
  end

  # POST /contadores
  # POST /contadores.json
  def create
    @contadore = Contadore.new(contadore_params)

    respond_to do |format|
      if @contadore.save
        format.html { redirect_to @contadore, notice: 'el Contador ha sido creado correctamente.' }
        format.json { render action: 'show', status: :created, location: @contadore }
      else
        format.html { render action: 'new' }
        format.json { render json: @contadore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contadores/1
  # PATCH/PUT /contadores/1.json
  def update
    respond_to do |format|
      if @contadore.update(contadore_params)
        format.html { redirect_to @contadore, notice: 'Contadore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contadore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contadores/1
  # DELETE /contadores/1.json
  def destroy
    @contadore.destroy
    respond_to do |format|
      format.html { redirect_to contadores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contadore
      @contadore = Contadore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contadore_params
      params.require(:contadore).permit(:num_serie, :calibre, :dt_instalacion, :dt_retirada, :dt_revision, :estado, :modelos_contadore_id )
    end
end
