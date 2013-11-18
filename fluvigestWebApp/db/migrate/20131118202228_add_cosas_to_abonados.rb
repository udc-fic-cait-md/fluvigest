class AddCosasToAbonados < ActiveRecord::Migration
  def change
    add_column :abonados, :telefono, :string
    add_column :abonados, :razon_social, :string
    add_column :abonados, :nif, :string
  end
end
