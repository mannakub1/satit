# == Schema Information
#
# Table name: student_subjects
#
#  id         :integer          not null, primary key
#  student_id :integer
#  subject_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  grade      :float
#  score1     :float
#  score2     :float
#

class StudentSubject < ActiveRecord::Base
  belongs_to :student
  belongs_to :subject
end
