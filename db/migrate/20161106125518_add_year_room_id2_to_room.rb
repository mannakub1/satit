class AddYearRoomId2ToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :year_room_id, :integer
  end
end
