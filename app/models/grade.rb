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

class Grade < ActiveRecord::Base
  belongs_to :student 


  scope :primary, -> { find_by(status: 'primary') }
  scope :secondary, -> { find_by(status: 'secondary') }
end
