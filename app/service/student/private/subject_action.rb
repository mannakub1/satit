module Student::Private::SubjectAction

  private 

  def process_add
    current_course_list.subjects.each do |subject|
      current_course_list.rooms.each do |room|
        room.student_rooms.each do |student|
          StudentSubject.where(subject_id: subject.id, student_room_id: student.id).first_or_create!
        end
      end
    end
  end

  def process_delete_by_subject
    current_course_list.rooms.each do |room|
      room.student_rooms.each do |student|
        current_student_subject(student.id).update_attributes(status: false)
      end
    end
  end

  def process_delete_subject
    current_subject.destroy
  end

  def process_delete_by_room
    current_room.student_rooms.each do |student|
      current_course_list.subjects.each do |subject|
        current_student_subject_with_student_room(student.id, subject.id).update_attributes(status: false)
      end
    end
  end

  def process_delete_room
    current_course_list.course_rooms.find_by(room_id: room_id).destroy    
  end

  def current_student_subject_with_student_room(student_room_id, subject_id)
    StudentSubject.find_by(subject_id: subject_id, student_room_id: student_room_id)
  end

  def current_student_subject(student_room_id)
    StudentSubject.find_by(subject_id: subject_id, student_room_id: student_room_id)
  end

  def current_subject
    Subject.find_by(id: subject_id)
  end

  def current_room
    Room.find_by(id: room_id)
  end

  def current_course_list
    CourseList.find_by(id: course_list_id)
  end
end