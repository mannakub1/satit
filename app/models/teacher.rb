# == Schema Information
#
# Table name: teachers
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  username        :string
#  password_digest :string
#  status          :string
#  resign          :boolean
#  prefix          :string
#

class Teacher < ActiveRecord::Base
  has_secure_password

  has_many :teacher_rooms, dependent: :destroy
  has_many :rooms, through: :teacher_rooms, source: :room
  
  has_many :teacher_course, dependent: :destroy
  has_many :subject, through: :teacher_course, source: :subject

  scope :present, -> { where(resign: true) }
end
