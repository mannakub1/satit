module Student::Private::SubjectActionGuard

  private

  def can_add?
    return "student already subject in course" unless already_subject?
    [true, nil]
  end

  def already_subject?
    !student_subject.find_by(subject_id: subject.id)
  end

  def student_subject
    student_course_list
  end

  # def student_course_list
  #   student.student_course_list.find_by(student_course_list_id: student_course_list.id)
  # end

end