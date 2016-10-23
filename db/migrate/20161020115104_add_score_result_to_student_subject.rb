class AddScoreResultToStudentSubject < ActiveRecord::Migration
  def change
    add_column :student_subjects, :score_result, :float
  end
end
