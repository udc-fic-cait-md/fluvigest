class AbonadosController < ApplicationController
    def new
        @abonado = Abonado.new
    end
    
    def create
        @abonado = Abonado.new(abonado_params)
        @abonado.save
        if @abonado.save
            redirect_to @abonado
        else
            render 'new'
        end
    end
    
    def show
        @abonado = Abonado.find(params[:id])
    end
    
    def index
        @abonados = Abonado.all
    end
    
    def edit
        @abonado = Abonado.find(params[:id])
    end
    
    def update
        @abonado = Abonado.find(params[:id])
        
        if @abonado.update(params[:abonado].permit(:nombre, :apellidos))
            redirect_to @abonado
            else
            render 'edit'
        end
    end
    
    def destroy
        @abonado = Abonado.find(params[:id])
        @abonado.destroy
        
        redirect_to abonados_path
    end
    
    private
        def abonado_params
            params.require(:abonado).permit(:nombre, :apellidos)
        end
end
