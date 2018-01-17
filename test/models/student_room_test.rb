# == Schema Information
#
# Table name: student_rooms
#
#  id             :integer          not null, primary key
#  student_id     :integer
#  room_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  cr             :integer
#  cp             :integer
#  ca             :integer
#  gp             :float
#  gpa            :float
#  level          :string
#  status         :boolean          default(TRUE)
#  student_status :boolean          default(TRUE)
#  code_number    :string
#  gpax           :float
#  crx            :float
#  cpx            :float
#  cax            :float
#  gpx            :float
#

require 'test_helper'

class StudentRoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
