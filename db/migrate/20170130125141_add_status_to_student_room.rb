class AddStatusToStudentRoom < ActiveRecord::Migration
  def change
    add_column :student_rooms, :status, :boolean, default:true
  end
end
