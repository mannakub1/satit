class DropTableCourseMainsandCourseExtendandActivty < ActiveRecord::Migration
  def change
    drop_table :course_mains
    drop_table :course_extends
    drop_table :activities
  end
end
