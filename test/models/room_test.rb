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
#  teacher_id :integer
#  status     :string
#

require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
