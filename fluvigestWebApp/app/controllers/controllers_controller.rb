class ControllersController < ApplicationController
  before_action :set_controller, only: [:show, :edit, :update, :destroy]

  # GET /controllers
  # GET /controllers.json
  def index
    @controllers = Controller.all
  end

  # GET /controllers/1
  # GET /controllers/1.json
  def show
  end

  # GET /controllers/new
  def new
    @controller = Controller.new
  end

  # GET /controllers/1/edit
  def edit
  end

  # POST /controllers
  # POST /controllers.json
  def create
    @controller = Controller.new(controller_params)

    respond_to do |format|
      if @controller.save
        format.html { redirect_to @controller, notice: 'Controller was successfully created.' }
        format.json { render action: 'show', status: :created, location: @controller }
      else
        format.html { render action: 'new' }
        format.json { render json: @controller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /controllers/1
  # PATCH/PUT /controllers/1.json
  def update
    respond_to do |format|
      if @controller.update(controller_params)
        format.html { redirect_to @controller, notice: 'Controller was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @controller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /controllers/1
  # DELETE /controllers/1.json
  def destroy
    @controller.destroy
    respond_to do |format|
      format.html { redirect_to controllers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_controller
      @controller = Controller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def controller_params
      params.require(:controller).permit(:tipo_tarifas)
    end
end
