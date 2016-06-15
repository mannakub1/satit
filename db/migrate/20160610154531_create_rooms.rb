class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :level
      t.string :year

      t.timestamps null: false
    end
  end
end
