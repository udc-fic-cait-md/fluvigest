class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.date :fecha_inicio
      t.date :fecha_fin
      t.references :abonados, index: true
      t.references :tipo_forma_pagos, index: true

      t.timestamps
    end
  end
end
