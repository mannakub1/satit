class AddSubjectIdToTeacherCourse < ActiveRecord::Migration
  def change
    add_column :teacher_courses, :subject_id, :integer
  end
end
