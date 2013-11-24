class AddModeloToContador < ActiveRecord::Migration
  def change
	add_column :contadores, :modelos_contadore_id, :integer
  end
end
