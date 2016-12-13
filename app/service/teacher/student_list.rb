class Teacher::StudentList

  attr_reader :student_id 

  def initialize(option = {})
    @student_id = option[:student_id]
  end

  def current_student
    Student.find_by(id: @student_id)
  end
end