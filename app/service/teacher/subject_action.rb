class Teacher::SubjectAction

  attr_reader :score1, :score2, :student_subject, :student, :params, :course_list_id, :subject_id, :room_id, :teacher, :grade, :student_rooms

  include Teacher::Private::SubjectAction
  include Teacher::Private::SubjectActionGuard

  def initialize(option = {})
    @student_rooms = option[:student_rooms]
    # @current_student_room = option[:current_student_room]
    @subject_id = option[:subject_id]
    @student = option[:student]
    @student_subject = option[:student_subject]
    @teacher = option[:teacher]
    @course_list_id = option[:course_list_id]
  end

  def add(params)
    @params = params

    can_add, message = can_add?
    fail message unless can_add

    process_add
  end

  def add_room(params)
    @room_id = params

    can_add_room, message = can_add_room?
    fail message unless can_add_room

    process_add_room
  end

  def edit(params)
    @params = params

    can_edit, message = can_edit?
    fail message unless can_edit

    puts params
    process_edit
  end

  # def test_process_update_gpa

  #   student_rooms.each{ |x| x.update_attributes(gp: calculate_gp(x), ca: calculate_ca(x), cp: calculate_cp(x), cr: calculate_cr(x), gpa:  calculate_gp(x) / process_ca(x))}
  # end

  def update_gpa
    process_update_gpa
  end

  def update_gpax
    process_update_gpax
  end

  def update_score
    # process_update_score
    process_update_gpa
    process_update_gpax
  end

  def edit_score(params)
    @score1 = params[:score1]
    @score2 = params[:score2]
    @grade ||= params[:grade]

    puts @score1
    puts @score1
    puts @grade

    # can_edit, message = can_edit?
    # fail message unless can_edit
    
    process_edit_score
  end

  def add_teacher(params)
    puts @subject_id
    puts params
    @params = params

    can_add_teacher, message = can_add_teacher?
    fail message unless can_add_teacher

    process_add_teacher
  end

  def delete_teacher(params)
    puts '555555'
    puts @subject_id
    puts params
    @params = params

    can_delete_teacher, message = can_delete_teacher?
    fail message unless can_delete_teacher?

    process_delete_teacher
    { status: true }
  end
end