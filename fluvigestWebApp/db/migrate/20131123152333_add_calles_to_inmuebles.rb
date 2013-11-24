class AddCallesToInmuebles < ActiveRecord::Migration
  def change
	add_column :inmuebles, :calle_id, :integer
  end
end
