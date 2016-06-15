class AddScoresToStudentSubject < ActiveRecord::Migration
  def change
    add_column :student_subjects, :score1, :float
    add_column :student_subjects, :score2, :float
  end
end
