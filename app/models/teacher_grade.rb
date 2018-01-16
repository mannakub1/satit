# == Schema Information
#
# Table name: teacher_grades
#
#  id                 :integer          not null, primary key
#  student_subject_id :integer
#  teacher_id         :integer
#  score1             :integer
#  score2             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  status_grade       :boolean
#  grade              :string           default("")
#  score_result       :string           default("0.0")
#

class TeacherGrade < ActiveRecord::Base
  belongs_to :student_subject
  belongs_to :teacher
end
