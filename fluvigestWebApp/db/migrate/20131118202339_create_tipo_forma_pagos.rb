class CreateTipoFormaPagos < ActiveRecord::Migration
  def change
    create_table :tipo_forma_pagos do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
