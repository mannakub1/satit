class AddCourseListIdtoSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :course_list_id, :integer
  end
end
