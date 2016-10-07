class AddStudentRoomIdToStudentSubject < ActiveRecord::Migration
  def change
    add_column :student_subjects, :student_room_id, :integer
  end
end
