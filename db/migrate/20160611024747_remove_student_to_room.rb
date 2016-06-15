class RemoveStudentToRoom < ActiveRecord::Migration
  def change
    remove_column :rooms, :student_id
  end
end
