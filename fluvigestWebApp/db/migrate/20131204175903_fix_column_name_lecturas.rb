class FixColumnNameLecturas < ActiveRecord::Migration
  def change
    rename_column :lecturas, :tincidencias_id, :tipo_incidencias_id
  end
end
