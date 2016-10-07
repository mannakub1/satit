class Admin::StudentSubjectAction

  attr_reader :student_room, :subject

  include Admin::Private::StudentSubjectActionGuard
  include Admin::Private::StudentSubjectAction

  def initialize(option = {})
    @student_room = option[:student_room]
  end

  def add(subject)
    @subject = subject

    can_add, message = can_add?
    fail message unless can_add

    process_add
  end

end