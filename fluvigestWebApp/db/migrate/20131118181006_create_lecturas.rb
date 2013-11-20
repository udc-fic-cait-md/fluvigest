class CreateLecturas < ActiveRecord::Migration
  def change
    create_table :lecturas do |t|

      t.timestamps
    end
  end
end
