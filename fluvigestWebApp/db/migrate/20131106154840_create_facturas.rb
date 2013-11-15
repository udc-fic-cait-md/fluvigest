class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.text :descripcion
      t.datetime :fecha
      t.text :nombre_cliente
      t.text :ap1_cliente
      t.text :ap2_cliente
      t.text :dni

      t.timestamps
    end
  end
end
