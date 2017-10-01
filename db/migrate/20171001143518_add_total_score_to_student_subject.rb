class AddTotalScoreToStudentSubject < ActiveRecord::Migration
  def change
    add_column :student_subjects, :total_score, :float
  end
end
