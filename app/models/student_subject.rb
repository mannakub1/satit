# == Schema Information
#
# Table name: student_subjects
#
#  id         :integer          not null, primary key
#  subject_id :integer
#  score1     :float
#  score2     :float
#  grade      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StudentSubject < ActiveRecord::Base
  belongs_to :student_room
  belongs_to :subject
end
