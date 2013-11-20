class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.string :password
      t.datetime :fechacreacion
      t.string :nombre
      t.string :apellidos
      
      t.timestamps
    end
  end
end
