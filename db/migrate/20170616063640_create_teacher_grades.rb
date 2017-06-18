class CreateTeacherGrades < ActiveRecord::Migration
  def change
    create_table :teacher_grades do |t|
      t.integer :student_subject_id
      t.integer :teacher_id
      t.integer :score1
      t.integer :score2
      t.string :grader
      t.float :score_reuslt

      t.timestamps null: false
    end
  end
end
