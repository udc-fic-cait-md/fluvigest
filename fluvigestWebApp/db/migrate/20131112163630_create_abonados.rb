class CreateAbonados < ActiveRecord::Migration
  def change
    create_table :abonados do |t|
      t.string :nombre
      t.string :apellidos

      t.timestamps
    end
  end
end
