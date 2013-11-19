class CreateTipoTarifas < ActiveRecord::Migration
  def change
    create_table :tipo_tarifas do |t|
      #t.integer :id
      t.string :nombre
      t.string :descripcion
      t.integer :tipo_servicio_id

      t.timestamps
    end
  end
end
