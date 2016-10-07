# == Schema Information
#
# Table name: teacher_courses
#
#  id             :integer          not null, primary key
#  teacher_id     :integer
#  course_list_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class TeacherCourse < ActiveRecord::Base
  belongs_to :teacher_id
  belongs_to :course_list
end
