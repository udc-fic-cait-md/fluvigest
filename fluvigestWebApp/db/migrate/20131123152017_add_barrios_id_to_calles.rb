class AddBarriosIdToCalles < ActiveRecord::Migration
  def change
	add_column :calles, :barrio_id, :integer
  end
end
