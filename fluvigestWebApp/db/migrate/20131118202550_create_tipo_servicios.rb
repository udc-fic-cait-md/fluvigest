class CreateTipoServicios < ActiveRecord::Migration
  def change
    create_table :tipo_servicios do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
