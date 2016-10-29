class CreateCourseRooms < ActiveRecord::Migration
  def change
    create_table :course_rooms do |t|
      t.integer :course_list_id
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
