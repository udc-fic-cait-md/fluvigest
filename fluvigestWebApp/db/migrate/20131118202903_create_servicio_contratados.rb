class CreateServicioContratados < ActiveRecord::Migration
  def change
    create_table :servicio_contratados do |t|
      t.references :contrato, index: true
      t.references :tipo_servicio, index: true
      t.date :fecha_inicio
      t.date :fecha_fin
      t.references :tipo_tarifa, index: true

      t.timestamps
    end
  end
end
