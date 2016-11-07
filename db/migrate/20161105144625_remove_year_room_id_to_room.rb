class RemoveYearRoomIdToRoom < ActiveRecord::Migration
  def change
    remove_column :rooms, :year_room_id
  end
end
