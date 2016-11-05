class CreateYearRooms < ActiveRecord::Migration
  def change
    create_table :year_rooms do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
