class RemoveScoreToStudentSubject < ActiveRecord::Migration
  def change
     remove_column :student_subjects, :score
  end
end
