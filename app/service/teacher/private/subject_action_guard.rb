module Teacher::Private::SubjectActionGuard

  private 

  def can_add?
    return [false, 'subject have a exist this course list'] unless already_subject?
    puts '5555666'

    [true, nil]
  end

  def can_edit?
    return [false, 'subject not have a exist'] unless not_already_subject?

    [true, nil]
  end

  def can_add_room?
    return [false, 'CourseList not have exist'] unless course_list_exist_by_ids?
    return [false, 'Room not have exist'] unless room_exist_by_ids?
    return [false, 'CourseRoom have exist'] unless course_room_exist_by_ids?

    [true, nil]
  end

  def can_add_teacher?
    return [false, 'Subject not have exist'] unless subject_exist_by_ids?
    return [false, 'Teacher not have exist'] unless teacher_exist_by_ids?
    return [false, 'TeacherCouese have exist'] unless teacher_course_exist_by_ids?

    [true, nil]
  end

  def can_delete_teacher?
    return [false, 'Subject not have exist'] unless subject_exist_by_ids?
    return [false, 'Teacher not have exist'] unless teacher_exist_by_ids?
    return [false, 'TeacherCouese not have exist'] unless teacher_course_exist_by_ids?

    [true, nil]
  end

  def course_list_exist_by_ids?
    current_course_list
  end

  def course_room_exist_by_ids?
    !CourseRoom.find_by(course_list_id: course_list_id, room_id: room_id)
  end

  def room_exist_by_ids?
    Room.find_by(id: room_id)
  end

  def already_subject?
    !current_course_list.subjects.find_by(params)
  end

  def not_already_subject?
    Subject.find_by(id: subject_id)
  end

  def current_course_list
    CourseList.find_by(id: course_list_id)
  end

  def not_teacher_course_exist_by_ids?
    !teacher_course_exist_by_ids?
  end

  def teacher_course_exist_by_ids?
    !TeacherCourse.find_by(subject_id: subject_id, teacher_id: teacher_id)
  end

  def teacher_exist_by_ids?
    Teacher.find_by(id: teacher_id)
  end

  def subject_exist_by_ids?
    Subject.find_by(id: subject_id)
  end

  def teacher_id
    params
  end

  def can_edit?
    # return [false, 'Course do not exist subject'] unless subject_exist?

    [true, nil]
  end

  def subject_exist?
    !course_list.subjects.find_by(name: params[:name], code: params[:code])
  end

end