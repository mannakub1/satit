module Student::Private::SubjectAction

  private 

  def process_add
    current_course_list.subjects.each do |subject|
      current_course_list.rooms.each do |room|
        room.student_rooms.each do |student|
          StudentSubject.where(subject_id: subject.id, student_room: student.id).first_or_create!
        end
      end
    end
  end

  def current_room
    Room.find_by(id: room_id)
  end

  def current_course_list
    CourseList.find_by(id: course_list_id)
  end
end