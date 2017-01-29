class Student::SubjectList

  attr_reader :student, :room, :subject_id, :room_id

  def initialize(option = {})
    @student = option[:student]
    @room_id = option[:room_id]
    @subject_id = option[:subject_id]
  end

  def subject_all
    student.student_rooms.order(:level)
  end

  def current_student_subject
    student_list = []

    current_student_rooms.each do |student|
      student_list << StudentSubject.find_by(student_room_id: student.id, subject_id: @subject_id)
    end

    # student_list.sort_by! &:student_room_id
    student_list
  end

  def current_room
    Room.find_by(id: @room_id)
  end

  def current_student_rooms
    current_room.student_rooms.order(:id)
  end

end