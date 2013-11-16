class CreateContadores < ActiveRecord::Migration
  def change
    create_table :contadores do |t|
      t.string :num_serie
      t.string :calibre
      t.datetime :dt_instalacion
      t.datetime :dt_retirada
      t.datetime :dt_revision
      t.string :estado

      t.timestamps
    end
  end
end
