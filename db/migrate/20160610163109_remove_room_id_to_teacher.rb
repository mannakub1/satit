class RemoveRoomIdToTeacher < ActiveRecord::Migration
  def change
    remove_column :teachers, :room_id
  end
end
