# == Schema Information
#
# Table name: student_subjects
#
#  id                   :integer          not null, primary key
#  student_id           :integer
#  subject_id           :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  grade                :float
#  score1               :float
#  score2               :float
#  score_primary_term   :float
#  score_secondary_term :float
#

require 'test_helper'

class StudentSubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
