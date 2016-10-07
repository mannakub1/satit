class SetDefault < ActiveRecord::Migration
  def change
    change_column :student_subjects, :score1, :integer, default: 0
    change_column :student_subjects, :score2, :integer, default: 0
    change_column :student_subjects, :grade, :string, default: ''
  end
end
