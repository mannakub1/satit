# == Schema Information
#
# Table name: father_lists
#
#  id         :integer          not null, primary key
#  adult_id   :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FatherList < ActiveRecord::Base

  belongs_to :adult
  belongs_to :student
  
end

