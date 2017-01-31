class AddStudentStatusToStudentRoom < ActiveRecord::Migration
  def change
    add_column :student_rooms, :student_status, :boolean, default:true
  end
end
