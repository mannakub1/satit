class Student::SubjectAction

  attr_reader :course_list_id, :room_id, :subject_id

  include Student::Private::SubjectActionGuard
  include Student::Private::SubjectAction

  def initialize(option = {})
    @course_list_id = option[:course_list_id]
  end

  def add
    process_add
  end

  def delete_subject(subject_id)
    @subject_id = subject_id

    process_delete_by_subject
    process_delete_subject
  end

  def delete_room(room_id)
    @room_id = room_id

    process_delete_by_room
    process_delete_room
  end

end 