class Teacher::StudentAction

  def initialize(option = {})
    @student ||= option[:student]
  end

  def add_student(code_number, first_name, last_name)
    Student.create(code_number: code_number, first_name: first_name, last_name: last_name, room_state: false)
  end

  def add_room(room)
    room.students.create(student_id: @student.id)
    student.update_attributes(room_state: true)
  end
end