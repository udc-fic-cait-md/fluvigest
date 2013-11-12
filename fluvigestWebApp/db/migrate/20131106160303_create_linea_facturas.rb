class CreateLineaFacturas < ActiveRecord::Migration
  def change
    create_table :linea_facturas do |t|
      t.references :factura, index: true
      t.integer :numero
      t.text :descripcion

      t.timestamps
    end
  end
end
