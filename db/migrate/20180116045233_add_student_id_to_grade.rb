class AddStudentIdToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :student_id, :integer
  end
end
