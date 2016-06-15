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

require 'test_helper'

class StudentRoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
