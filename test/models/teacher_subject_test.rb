# == Schema Information
#
# Table name: teacher_subjects
#
#  id         :integer          not null, primary key
#  teacher_id :integer
#  subject_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TeacherSubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
