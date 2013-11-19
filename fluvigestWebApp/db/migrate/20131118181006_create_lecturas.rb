class CreateLecturas < ActiveRecord::Migration
  def change
    create_table :lecturas do |t|
      t.decimal  :lectura
      t.string   :incidencia
      t.datetime :fecha
      t.decimal  :lectura_anterior
      t.integer  :usuarios_id
      t.integer  :contadores_id
      t.integer  :tincidencias_id

      t.timestamps
    end
  end
end
