# == Schema Information
#
# Table name: course_lists
#
#  id           :integer          not null, primary key
#  course_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  room_level   :string
#  year_room_id :integer
#  full_name    :string
#

FactoryGirl.define do
  factory :course_list do
    course_id { Course.last.id }
    room_level { Faker::Number.between(1, 6).to_s }
    full_name { "ชั้นมัธยมศึกษาปีที่#{room_level}" }
  end
end
