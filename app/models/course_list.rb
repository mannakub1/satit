# == Schema Information
#
# Table name: course_lists
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_level :string
#

class CourseList < ActiveRecord::Base
  belongs_to :course
  # has_many :course_mains
  # has_many :subject_mains, through: :course_mains, source: :subject
  
  # has_many :course_extends
  # has_many :subject_extends, through: :course_extends, source: :subject
 
  # has_many :activities
  # has_many :subject_activities, through: :activities, source: :subject
  has_many :course_rooms
  has_many :rooms, through: :course_rooms, source: :room

  has_many :techer_courses
  has_many :subjects

end
