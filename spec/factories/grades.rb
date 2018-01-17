# == Schema Information
#
# Table name: grades
#
#  id         :integer          not null, primary key
#  gpax       :float
#  cr         :float
#  cp         :float
#  ca         :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :integer
#  status     :string
#

FactoryGirl.define do
  factory :grade do
    gpax 1.5
    cr 1.5
    cp 1.5
    ca 1.5
  end
end
