class Student::SubjectAction

  attr_reader :student, :subject, :student_course_list

  include Student::Private::SubjectActionGuard

  def initialize(option = {})
    @subject = option[:subject]
    @student_course_list = option[:student_course_list]
  end

  def add
    can_add ,message = can_add?
    fail message unless can_add

    process_add
  end

end 