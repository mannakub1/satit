# == Schema Information
#
# Table name: student_course_lists
#
#  id             :integer          not null, primary key
#  student_id     :integer
#  course_list_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class StudentCourseListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
