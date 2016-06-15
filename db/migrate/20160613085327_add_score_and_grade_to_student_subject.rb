class AddScoreAndGradeToStudentSubject < ActiveRecord::Migration
  def change
    add_column :student_subjects, :score, :float
    add_column :student_subjects, :grade, :float
  end
end
