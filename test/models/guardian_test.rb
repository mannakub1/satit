# == Schema Information
#
# Table name: guardians
#
#  id         :integer          not null, primary key
#  adult_id   :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GuardianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
