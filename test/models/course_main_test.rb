# == Schema Information
#
# Table name: course_mains
#
#  id             :integer          not null, primary key
#  course_list_id :integer
#  subject_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class CourseMainTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
