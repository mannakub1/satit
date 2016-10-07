# == Schema Information
#
# Table name: student_course_lists
#
#  id             :integer          not null, primary key
#  student_id     :integer
#  course_list_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class StudentCourseList < ActiveRecord::Base
  belongs_to :student
  belongs_to :course_list

  has_many :student_subjects, dependent: :destroy
  # has_many :subjects, through: :student_subjects, source: :subject
  # has_many :students, through: :student_subjects, source: :student

end
