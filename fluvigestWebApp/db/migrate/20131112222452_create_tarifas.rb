class CreateTarifas < ActiveRecord::Migration
  def change
    create_table :tarifas do |t|
    
      t.timestamps
    end
  end
end
