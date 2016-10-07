class RemoveStudentCourseListId < ActiveRecord::Migration
  def change
    remove_column :student_subjects, :student_course_list_id, :integer
  end
end
