# == Schema Information
#
# Table name: course_rooms
#
#  id             :integer          not null, primary key
#  course_list_id :integer
#  room_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class CourseRoom < ActiveRecord::Base
  belongs_to :course_list
  belongs_to :room
end
