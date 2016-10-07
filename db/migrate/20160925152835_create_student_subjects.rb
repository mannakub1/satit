class CreateStudentSubjects < ActiveRecord::Migration
  def change
    create_table :student_subjects do |t|
      t.integer :student_course_list_id
      t.integer :subject_id
      t.float :score1
      t.float :score2
      t.string :grade

      t.timestamps null: false
    end
  end
end
