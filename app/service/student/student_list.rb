class Student::StudentList

  attr_reader :student

  def initialize(student)
    @student = student
  end

  def rooms
    student.rooms
  end

  def subjects
    student.subjects
  end

end