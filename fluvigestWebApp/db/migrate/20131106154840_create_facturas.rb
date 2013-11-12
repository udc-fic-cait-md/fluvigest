class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.text :descripcion
      t.datetime :fecha

      t.timestamps
    end
  end
end
