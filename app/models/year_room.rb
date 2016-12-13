# == Schema Information
#
# Table name: year_rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class YearRoom < ActiveRecord::Base
  has_many :rooms
end
