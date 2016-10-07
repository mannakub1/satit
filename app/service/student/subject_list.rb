class Student::SubjectList

  attr_reader :student, :room

  def initialize(option = {})
    @student = option[:student]
  end

  def subject_all
    student.student_rooms
  end
end