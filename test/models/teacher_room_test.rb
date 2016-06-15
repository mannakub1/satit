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

require 'test_helper'

class TeacherRoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
