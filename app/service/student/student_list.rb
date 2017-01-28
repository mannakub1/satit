class Student::StudentList

  attr_reader :code_number, :first_name, :last_name, :year

  def initialize(option = {})
    @code_number = option[:code_number]
    @first_name = option[:first_name]
    @last_name = option[:last_name]
    @year = option[:year]
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

  def student_year_room
    student = []
    puts current_year_room.name
    current_year_room.rooms.where(level: 'ป.3').each do |room|
      room.students.each do |std|
        if !YearRoom.find_by(name: @year).rooms.find_by(name: room.name).students.find_by(first_name: std.first_name, last_name: std.last_name)
          student << std
        end
      end
    end    
    
    student
  end


  def current_year_room
    YearRoom.find_by(name: @year-1)
  end
end