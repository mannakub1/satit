class Student::SubjectAction

  attr_reader :course_list_id, :room_id

  include Student::Private::SubjectActionGuard
  include Student::Private::SubjectAction

  def initialize(option = {})
    @course_list_id = option[:course_list_id]
  end

  def add
    process_add
  end

end 