class AddCamposLecturas < ActiveRecord::Migration
  def change
    add_column :lecturas, :lectura, :float
    add_column :lecturas, :incidencia, :string
    add_column :lecturas, :fecha, :datetime
    add_column :lecturas, :lectura_anterior, :float
    add_column :lecturas, :usuarios_id, :integer
    add_column :lecturas, :contadores_id, :integer
    add_column :lecturas, :tincidencias_id, :integer  
  end
end