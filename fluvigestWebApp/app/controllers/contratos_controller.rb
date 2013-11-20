class ContratosController < ApplicationController
    def create
        @abonado = Abonado.find(params[:abonado_id])
        @contrato = @abonado.contratos.create(params[:contrato].permit(:fecha_inicio, :fecha_fin))
        redirect_to abonado_path(@abonado)
    end
end
