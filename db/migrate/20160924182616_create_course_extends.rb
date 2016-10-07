class CreateCourseExtends < ActiveRecord::Migration
  def change
    create_table :course_extends do |t|
      t.integer :course_list_id
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
