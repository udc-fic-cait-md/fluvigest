class DomiciliacionsController < ApplicationController
  def new
    @domiciliacion = Domiciliacion.new
  end

  def create
    @domiciliacion = Domiciliacion.new(domiciliacion_params)
    @domiciliacion.save
    if @domiciliacion.save
      redirect_to @domiciliacion
    else
      render 'new'
    end
  end

  def show
    @domiciliacion = Domiciliacion.find(params[:id])
  end

  def index
    @domiciliacions = Domiciliacion.all
  end

  def edit
    @domiciliacion = Domiciliacion.find(params[:id])
  end

  def update
    @domiciliacion = Domiciliacion.find(params[:id])

    if @domiciliacion.update(params[:domiciliacion].permit!)
      redirect_to @domiciliacion
    else
      render 'edit'
    end
  end

  def destroy
    @domiciliacion = Domiciliacion.find(params[:id])
    @domiciliacion.fecha_fin = Time.now
    @domiciliacion.save
    redirect_to domiciliacion_path
  end

  private

  def domiciliacion_params
    params.require(:domiciliacion).permit!
  end

end
