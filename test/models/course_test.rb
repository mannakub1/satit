# == Schema Information
#
# Table name: courses
#
#  id                 :integer          not null, primary key
#  year               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  status_show_grades :boolean
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
