class RemoveTeacherIdToStudentSubject < ActiveRecord::Migration
  def change
    remove_column :student_subjects, :teacher_id
  end
end
