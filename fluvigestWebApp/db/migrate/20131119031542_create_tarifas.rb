class CreateTarifas < ActiveRecord::Migration
  def change
    create_table :tarifas do |t|
      t.references :tipo_tarifa, index: true
      #t.integer :id
      t.float :precio
      t.date :fecha_inicio
      t.date :fecha_fin

      t.timestamps
    end
  end
end
