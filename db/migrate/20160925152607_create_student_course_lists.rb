class CreateStudentCourseLists < ActiveRecord::Migration
  def change
    create_table :student_course_lists do |t|
      t.integer :student_id
      t.integer :course_list_id

      t.timestamps null: false
    end
  end
end
