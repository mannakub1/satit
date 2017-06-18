class AddTeacherIdToStudentSubject < ActiveRecord::Migration
  def change
    add_column :student_subjects, :teacher_id, :integer
  end
end
