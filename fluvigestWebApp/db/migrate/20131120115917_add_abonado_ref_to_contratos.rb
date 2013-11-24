class AddAbonadoRefToContratos < ActiveRecord::Migration
  def change
    add_reference :contratos, :abonado, index: true
  end
end
