# == Schema Information
#
# Table name: teacher_rooms
#
#  id         :integer          not null, primary key
#  teacher_id :integer
#  room_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TeacherRoom < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :room
end
