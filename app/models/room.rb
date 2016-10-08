# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  level      :string
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string
#

class Room < ActiveRecord::Base

  has_many :teacher_rooms, dependent: :destroy
  has_many :teachers, through: :teacher_rooms, source: :teacher

  has_many :student_rooms, dependent: :destroy
  has_many :students, through: :student_rooms, source: :student

  scope :present, -> { where(year: DateTime.now.year) }
end
