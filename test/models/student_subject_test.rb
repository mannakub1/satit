# == Schema Information
#
# Table name: student_subjects
#
#  id         :integer          not null, primary key
#  subject_id :integer
#  score1     :float
#  score2     :float
#  grade      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StudentSubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
