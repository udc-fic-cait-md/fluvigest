class LecturasController < ApplicationController
  
  def index
    @lecturas = Lectura.all
  end
  
  def show
    @lectura = Lectura.find(params[:id])
  end
  
  def new
    @lectura = Lectura.new
  end
  
  def create
    @lectura = Lectura.new(lectura_params)
    @lectura.save
    if @lectura.save
      redirect_to lecturas_path
    else
      render 'new'
    end
  end
  
  def destroy
    @lecturas = Lectura.find(params[:id])
    @lecturas.destroy 
    redirect_to lecturas_path
    end
  
  private
    def lectura_params
      params.require(:lectura)
          .permit(:lectura, :fecha, :lectura_anterior, :incidencia, :tincidencias_id, :usuarios_id, :contadores_id)
    end
end
