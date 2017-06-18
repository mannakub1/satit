# == Schema Information
#
# Table name: teacher_grades
#
#  id                 :integer          not null, primary key
#  student_subject_id :integer
#  teacher_id         :integer
#  score1             :integer
#  score2             :integer
#  grader             :string
#  score_reuslt       :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class TeacherGradeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
