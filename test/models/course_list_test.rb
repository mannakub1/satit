# == Schema Information
#
# Table name: course_lists
#
#  id           :integer          not null, primary key
#  course_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  room_level   :string
#  year_room_id :integer
#  full_name    :string
#

require 'test_helper'

class CourseListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
