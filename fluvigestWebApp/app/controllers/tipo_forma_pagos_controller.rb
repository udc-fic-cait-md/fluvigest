class TipoFormaPagosController < ApplicationController
  def new
    @t = TipoFormaPago.new
  end

  def create
    @t = TipoFormaPago.new(tipo_forma_pago_params)
    if @t.save
      redirect_to @t
    else
      render 'new'
    end
  end

  def show
    @t = TipoFormaPago.find(params[:id])
  end

  def index
    @ts = TipoFormaPago.all
  end

  def edit
    @t =TipoFormaPago.find(params[:id])
  end

  def update
    @t = TipoFormaPago(params[:id])
  end

  def destroy
    @t = TipoFormaPago.find(params[:id])
    @t.destroy

    redirect_to tipo_forma_pagos_path
  end

  private

  def tipo_forma_pagos_params
    params.require(:tipo_forma_pago).permit!
  end
  
end
