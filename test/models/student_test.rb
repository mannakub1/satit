# == Schema Information
#
# Table name: students
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  iden_number     :string
#  code_number     :string
#  room_state      :boolean
#  blood           :string
#  birthdate       :datetime
#  address         :string
#  call            :string
#  zip_code        :string
#  ability         :string
#  nationality     :string
#  ethnicity       :string
#  district        :string
#  parish          :string
#  city            :string
#  prefix          :string
#  delete_status   :string
#  username        :string
#  password_digest :string
#  image           :string
#  thumb           :string           default("")
#  gpax_primary    :float
#  gpax_secondary  :float
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
