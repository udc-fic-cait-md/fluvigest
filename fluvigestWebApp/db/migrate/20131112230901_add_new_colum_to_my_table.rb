class AddNewColumToMyTable < ActiveRecord::Migration
  def change
   add_column :tarifas, :nombre, :string
   add_column :tarifas, :descripcion, :string
   add_column :tarifas, :tipo, :string
   add_column :tarifas, :precioBasura,:decimal
   add_column :tarifas, :precioAlquiler, :decimal   
   add_column :tarifas, :engancheContador, :boolean
      # :nombre,:descripcion, :tipo, :precioBasura,:engancheContador,:precioAlquiler
	  
=begin 
	  change_table :tarifas do |t|
		text :nombre,
		text :descripcion,
		text :tipo,
		decimal :precioBasura,
		boolean :engancheContador,
		decimal :precioAlquiler
=end

  end
end
