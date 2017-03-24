# == Schema Information
#
# Table name: student_subjects
#
#  id              :integer          not null, primary key
#  subject_id      :integer
#  score1          :integer          default(0)
#  score2          :integer          default(0)
#  grade           :string           default("")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  student_room_id :integer
#  score_result    :float
#  status          :boolean          default(TRUE)
#  status_grade    :boolean          default(FALSE)
#

require 'test_helper'

class StudentSubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
