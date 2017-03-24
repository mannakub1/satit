# == Schema Information
#
# Table name: rooms
#
#  id           :integer          not null, primary key
#  name         :string
#  level        :string
#  year         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :string
#  year_room_id :integer
#  priority     :integer
#

class Room < ActiveRecord::Base

  has_many :teacher_rooms, dependent: :destroy
  has_many :teachers, through: :teacher_rooms, source: :teacher

  has_many :student_rooms, dependent: :destroy
  has_many :students, through: :student_rooms, source: :student

  has_many :course_rooms
  has_many :course_lists, through: :course_rooms, source: :course_list

  belongs_to :year_room

  scope :present, -> { where(year: DateTime.now.year) }
end
