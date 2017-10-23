class Student::SubjectList

  attr_reader :student, :room, :subject_id, :room_id

  def initialize(option = {})
    @student = option[:student]
    @room_id = option[:room_id]
    @subject_id = option[:subject_id]
  end

  def subject_all
    student.student_rooms.order(:level)

    # arr = []
    # student.student_rooms.order(:level).each do |std_room|
    #   arr << std_room.as_json  
    #   arr.last[:room] = std_room.room.as_json
    #   arr.last[:student_subjects] = []
    #   std_room.student_subjects.order(:id).each do |std_subject|
    #     arr.last[:student_subjects] << std_subject.as_json
    #     arr.last[:student_subjects].last[:subject] =  std_subject.subject.as_json
    #   end  
    # end  
    
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