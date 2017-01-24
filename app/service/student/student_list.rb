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
    Student.where('code_number LIKE ?', "%#{@code_number}%").order(:code_number)
  end

  def current_student_by_first_name
     Student.where('first_name LIKE ?', "%#{@first_name}%").order(:code_number)
  end

  def current_student_by_last_name
     Student.where('last_name LIKE ?', "%#{@last_name}%").order(:code_number)
  end
end