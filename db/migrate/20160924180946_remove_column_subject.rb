class RemoveColumnSubject < ActiveRecord::Migration
  def change
    remove_column :rooms, :teacher_id
    drop_table :student_subjects
    drop_table :teacher_subjects
  end
end
