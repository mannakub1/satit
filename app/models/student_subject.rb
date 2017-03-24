# == Schema Information
#
# Table name: student_subjects
#
#  id              :integer          not null, primary key
#  subject_id      :integer
#  score1          :integer          default(0)
#  score2          :integer          default(0)
#  grade           :string           default("")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  student_room_id :integer
#  score_result    :float
#  status          :boolean          default(TRUE)
#  status_grade    :boolean          default(FALSE)
#

class StudentSubject < ActiveRecord::Base
  belongs_to :student_room
  belongs_to :subject

  scope :present, -> { where(status: true) }
end
