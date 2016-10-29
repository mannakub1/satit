# == Schema Information
#
# Table name: teacher_courses
#
#  id         :integer          not null, primary key
#  teacher_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#

class TeacherCourse < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :subject
end
