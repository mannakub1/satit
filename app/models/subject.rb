# == Schema Information
#
# Table name: subjects
#
#  id             :integer          not null, primary key
#  name           :string
#  teacher_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  code           :string
#  hour_per_year  :string
#  course_list_id :integer
#  type           :string
#  credit         :float
#

class Subject < ActiveRecord::Base
  belongs_to :course_list

  has_many :student_subjects
  has_many :student_rooms , through: :student_subjects, source: :student_room

  # has_many :course_mains
  # has_many :subject_mains, through: :course_mains, source: :course_list
  
  # has_many :course_extends
  # has_many :extends, through: :course_extends, source: :course_list

  # has_many :activities
  # has_many :activities, through: :activitiesr, source: :course_list
end
