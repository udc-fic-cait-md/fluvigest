class ServicioContratadosController < ApplicationController
  def new
    @s = Servicio.new
  end

  def create
    @s = Servicio.new(servicio_params)
    if (@s.save)
      redirect_to @s
    else
      render 'new'
    end
  end

  def show
    @s = Servicio.find(params[:id])
  end

  def index
    @ss = Servicio.all
  end

  def edit
    @s = Servicio.find(params[:id])
  end

  def update
    @s = Servicio.find(params[:id])
    
    if @s.update(params[:servicio])
      redirect_to @s
    else
      render 'edit'
    end

  def destroy
    @s = Servicio.find(params[:id])
    @s.destroy
    
    redirect_to servicios_path
  end

end
