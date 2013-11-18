class CreateModelosContadores < ActiveRecord::Migration
  def change
    create_table :modelos_contadores do |t|
      t.string :marca
      t.string :modelo

      t.timestamps
    end
  end
end
