class Teacher::StudentAction

  def initialize(option = {})
    @student_id ||= option[:student_id]
  end

  def add_student(code_number, first_name, last_name)
    Student.create(code_number: code_number, first_name: first_name, last_name: last_name, room_state: false)
  end

  def add_room(room)
    room.students.create(student_id: @student.id)
    student.update_attributes(room_state: true)
  end

  def edit(params)
    params.except!(:id)
    puts params
    current_student.update_attributes(params)

    current_student
  end

  def current_student
    Student.find_by(id: @student_id)
  end
end