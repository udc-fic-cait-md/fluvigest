class CreateTarifas < ActiveRecord::Migration
  def change
    create_table :tarifas do |t|
      #t.integer :id
      t.float :precio
      t.date :fecha_inicio
      t.date :fecha_fin
      t.integer :tipo_tarifa_id

      t.timestamps
    end
  end
end
