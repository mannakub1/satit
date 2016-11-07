class ChagneStatusToStudentSubject < ActiveRecord::Migration
  def change
    change_column :student_subjects, :status, :boolean, default: true
  end
end
