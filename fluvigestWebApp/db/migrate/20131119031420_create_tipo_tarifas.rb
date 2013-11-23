class CreateTipoTarifas < ActiveRecord::Migration
  def change
    create_table :tipo_tarifas do |t|
      t.references :tipo_servicio, index: true
      #t.integer :id
      t.string :nombre
      t.string :descripcion


      t.timestamps
    end
  end
end
