# == Schema Information
#
# Table name: api_keys
#
#  id           :integer          not null, primary key
#  access_token :string
#  expires_at   :datetime
#  student_id   :integer
#  active       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  admin_id     :integer
#

require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
