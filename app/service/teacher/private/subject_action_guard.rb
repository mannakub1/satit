module Teacher::Private::SubjectActionGuard

  private 

  def can_add?
    return [false, 'Course have exist subject'] unless subject_exist?
 
    [true, nil]
  end

  def can_add_teacher?
    return [false, 'Subject not have exist'] unless subject_exist_by_ids?
    return [false, 'Teacher not have exist'] unless teacher_exist_by_ids?
    return [false, 'TeacherCouese have exist'] unless not_teacher_course_exist_by_ids

    [true, nil]
  end

  def can_delete_teacher?
    return [false, 'Subject not have exist'] unless subject_exist_by_ids?
    return [false, 'Teacher not have exist'] unless teacher_exist_by_ids?
    return [false, 'TeacherCouese not have exist'] unless teacher_course_exist_by_ids?

    [true, nil]
  end

  def not_teacher_course_exist_by_ids
    !teacher_course_exist_by_ids?
  end

  def teacher_course_exist_by_ids?
    !TeacherCourse.find_by(subject_id: subject_id, teacher_id: teacher_id)
  end

  def teacher_exist_by_ids?
    !Teacher.find_by(id: teacher_id)
  end

  def subject_exist_by_ids?
    !Subject.find_by(id: subject_id)
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