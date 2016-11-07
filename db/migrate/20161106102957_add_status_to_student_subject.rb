class AddStatusToStudentSubject < ActiveRecord::Migration
  def change
    add_column :student_subjects, :status, :boolean
  end
end
