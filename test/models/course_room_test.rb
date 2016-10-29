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

require 'test_helper'

class CourseRoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
