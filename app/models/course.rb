# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Course < ActiveRecord::Base
  
  has_many :course_lists
  has_many :rooms, through: :course_lists, source: :room

end
