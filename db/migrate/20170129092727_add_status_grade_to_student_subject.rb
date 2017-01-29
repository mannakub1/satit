class AddStatusGradeToStudentSubject < ActiveRecord::Migration
  def change
    add_column :student_subjects, :status_grade, :boolean, default:false
  end
end
