class CreateCalles < ActiveRecord::Migration
  def change
    create_table :calles do |t|
      t.string :nombre
      t.string :zona

      t.timestamps
    end
  end
end
