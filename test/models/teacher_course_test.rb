# == Schema Information
#
# Table name: teacher_courses
#
#  id         :integer          not null, primary key
#  teacher_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#

require 'test_helper'

class TeacherCourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
