class AddInmuebleToContador < ActiveRecord::Migration
  def change
	add_column :contadores, :inmueble_id, :integer
  end
end
