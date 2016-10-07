# == Schema Information
#
# Table name: subjects
#
#  id             :integer          not null, primary key
#  name           :string
#  teacher_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  code           :string
#  hour_per_year  :string
#  course_list_id :integer
#

require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
