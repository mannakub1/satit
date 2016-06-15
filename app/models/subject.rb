# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  name       :string
#  teacher_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subject < ActiveRecord::Base
  has_many :teacher_subjects, dependent: :destroy
  has_many :teahcers, through: :teacher_subjects, source: :teacher

  has_many :student_subjects, dependent: :destroy
  has_many :students, through: :student_subjects, source: :student
end
