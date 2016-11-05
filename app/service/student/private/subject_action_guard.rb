module Student::Private::SubjectActionGuard

  private

  def can_add?
    return [false, 'student already subject in course'] unless already_student_subject?

    [true, nil]
  end

  def already_student_subject?
    !StudentSubject.find_by(subject_id: subject_id, student_room_id: student_room_id)
  end

 

  # def student_course_list
  #   student.student_course_list.find_by(student_course_list_id: student_course_list.id)
  # end

end