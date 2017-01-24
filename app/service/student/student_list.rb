class Student::StudentList

  attr_reader :code_number, :first_name, :last_name

  def initialize(option = {})
    @code_number = option[:code_number]
    @first_name = option[:first_name]
    @last_name = option[:last_name]
  end

  def year_room
    YearRoom.all
  end

  def current_student_by_code_number
    Student.find_by(code_number: @code_number)
  end

  def current_student_by_first_name
    Student.find_by(first_name: @first_name)
  end

  def current_student_by_last_name
    Student.find_by(last_name: @last_name)
  end
end