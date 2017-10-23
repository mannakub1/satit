# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :course do

    year { Faker::Number.number(4) }
  end
end
