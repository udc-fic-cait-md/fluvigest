class CreateDomiciliacions < ActiveRecord::Migration
  def change
    create_table :domiciliacions do |t|
      t.string :ccc
      t.string :titular
      t.string :direccion
      t.string :telefono
      t.string :nif
      t.date :fecha_inicio
      t.date :fecha_fin
      t.references :contrato, index: true

      t.timestamps
    end
  end
end
