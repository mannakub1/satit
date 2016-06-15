class CreateTeacherSubjects < ActiveRecord::Migration
  def change
    create_table :teacher_subjects do |t|
      t.references :teacher, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
