class TipoServiciosController < ApplicationController
  def new
    @t = TipoServicio.new
  end

  def create
    @t = TipoServicio.new(tipo_servicio_params)
    if @t.save
      redirect_to @t
    else
      render 'new'
    end
  end

  def show
    @t = TipoServicio.find(params[:id])
  end

  def index
    @ts = TipoServicio.all
  end

  def edit
    @t =TipoServicio.find(params[:id])
  end

  def update
    @t = TipoServicio(params[:id])
  end

  def destroy
    @t = TipoServicio.find(params[:id])
    @t.destroyo
    
    redirect_to tipo_servicios_path
  end
  
  private
  
  def tipo_servicio_params
    params.require(:tipo_servicio).permit!
  end
end
