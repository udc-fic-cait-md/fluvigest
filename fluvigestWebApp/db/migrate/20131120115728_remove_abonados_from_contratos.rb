class RemoveAbonadosFromContratos < ActiveRecord::Migration
  def change
    remove_reference :contratos, :abonados, index: true
  end
end
