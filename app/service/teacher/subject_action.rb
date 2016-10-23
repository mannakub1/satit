class Teacher::SubjectAction

  attr_reader :score1, :score2, :student_subject, :student, :params, :course_list

  include Teacher::Private::SubjectAction
  include Teacher::Private::SubjectActionGuard

  def initialize(option = {})
    @student = option[:student]
    @student_subject = option[:student_subject]
    @course_list = option[:course_list]
  end

  def add(params)
    @params = params

    can_add, message = can_add?
    fail message unless can_add

    process_add
  end

  def edit_score(score1, score2)
    @score1 = score1
    @score2 = score2

    # can_edit, message = can_edit?
    # fail message unless can_edit
    
    process_edit
  end

end