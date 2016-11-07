class AddYearRoomIdToCourseList < ActiveRecord::Migration
  def change
    add_column :course_lists, :year_room_id, :integer
  end
end
