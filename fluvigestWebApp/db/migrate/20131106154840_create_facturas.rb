class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.text :descripcion
      t.string :periodo
      t.date :fecha_emision
      t.integer :estado
      t.string :detalle_facturacion
      t.string :nombre_cliente
      t.string :direccion
      t.integer :codigo_postal
      t.string :poblacion
      t.string :provincia
      t.string :banco
      t.string :numero_cuenta
      t.string :dni

      t.timestamps
    end
  end
end
