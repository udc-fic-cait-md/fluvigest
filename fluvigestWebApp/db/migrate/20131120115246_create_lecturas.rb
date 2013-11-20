class CreateLecturas < ActiveRecord::Migration
  def change
    create_table :lecturas do |t|
      t.float :lectura
      t.string :incidencia
      t.datetime :fecha
      t.float :lectura_anterior
      t.integer :usuarios_id
      t.integer :contadores_id
      t.integer :tincidencias_id

      t.timestamps
    end
  end
end