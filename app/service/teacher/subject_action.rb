class Teacher::SubjectAction

  attr_reader :score1, :score2, :student_subject, :student, :params, :course_list_id, :subject_id, :room_id

  include Teacher::Private::SubjectAction
  include Teacher::Private::SubjectActionGuard

  def initialize(option = {})
    @subject_id = option[:subject_id]
    @student = option[:student]
    @student_subject = option[:student_subject]
    @course_list_id = option[:course_list_id]
  end

  def add(params)
    @params = params

    can_add, message = can_add?
    fail message unless can_add

    process_add
  end

  def add_room(params)
    puts course_list_id
    puts params
    @room_id = params

    can_add_room, message = can_add_room?
    fail message unless can_add_room

    process_add_room
  end


  def edit_score(score1, score2)
    @score1 = score1
    @score2 = score2

    # can_edit, message = can_edit?
    # fail message unless can_edit
    
    process_edit
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