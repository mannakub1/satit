# == Schema Information
#
# Table name: teacher_subjects
#
#  id         :integer          not null, primary key
#  teacher_id :integer
#  subject_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TeacherSubject < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :subject
end
