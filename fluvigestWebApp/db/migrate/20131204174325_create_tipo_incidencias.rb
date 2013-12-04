class CreateTipoIncidencias < ActiveRecord::Migration
  def change
    create_table :tipo_incidencias do |t|
       t.string :descripcion
       
    end
  end
end
