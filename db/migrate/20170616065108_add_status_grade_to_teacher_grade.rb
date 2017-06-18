class AddStatusGradeToTeacherGrade < ActiveRecord::Migration
  def change
    add_column :teacher_grades, :status_grade, :boolean
  end
end
