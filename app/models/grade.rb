class Grade < ActiveRecord::Base
  belongs_to :student 


  scope :primary, -> { find_by(status: 'primary') }
  scope :secondary, -> { find_by(status: 'secondary') }
end
