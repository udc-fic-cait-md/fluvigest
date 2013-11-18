class CreateInmuebles < ActiveRecord::Migration
  def change
    create_table :inmuebles do |t|
      t.string :numero
      t.string :piso
      t.string :portal
      t.string :puerta
      t.string :nombre
      t.integer :orden
      t.string :cod_postal
      t.string :escalera
      t.string :inmueblescol

      t.timestamps
    end
  end
end
