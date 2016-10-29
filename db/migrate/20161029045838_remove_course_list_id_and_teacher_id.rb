class RemoveCourseListIdAndTeacherId < ActiveRecord::Migration
  def change
    remove_column :subjects, :teacher_id
    remove_column :teacher_courses, :course_list_id
  end
end
