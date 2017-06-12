class Teacher::StudentAction

  attr_reader :student, :student_id, :room, :code_number, :first_name, :last_name, :params, :subject, :student_room

  include Teacher::Private::StudentAction
  include Teacher::Private::StudentActionGuard

  def initialize(option = {})
    @student_id ||= option[:student_id]
    @student ||= option[:student]
    @subject ||= option[:subject]
    @room ||= option[:room]
    @student_room ||= option[:student_room]
  end

  def add_student(params)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @code_number = params[:code_number]
    @params = params

    can_add, message = can_add?
    fail message unless can_add

    process_add_student
  end

  def delete_student

  end

  def add_room(room)
    @room = room
    
    can_add_room, message = can_add_room?
    fail message unless can_add_room

    process_add_room
    @student.student_rooms.last.update_attributes(status: false)
    # student_room.update_attributes(room_state: true)
  end

  def edit(params)
    params.except!(:id)
    puts params
    current_student.update_attributes(params)

    current_student
  end

  def add_subject

    can_add_subject, message = can_add_subject?
    fail message unless can_add_subject

    process_add_subject
  end

  def current_student
    Student.find_by(id: @student_id)
  end

  def student_room_delete

    can_student_room_delete, message = can_student_room_delete?
    fail message = unless can_student_room_delete

    process_student_room_delete
  end

end