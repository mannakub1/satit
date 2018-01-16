# == Schema Information
#
# Table name: adults
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  address     :string
#  call        :string
#  zip_code    :string
#  enthicity   :string
#  district    :string
#  parish      :string
#  city        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  prefix      :string
#  nationality :string
#  iden_number :string
#  image       :string
#  thumb       :string           default("img/student/avatar.png")
#

require 'test_helper'

class AdultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
