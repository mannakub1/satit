# == Schema Information
#
# Table name: student_rooms
#
#  id         :integer          not null, primary key
#  student_id :integer
#  room_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StudentRoom < ActiveRecord::Base
  belongs_to :student
  belongs_to :room
end
