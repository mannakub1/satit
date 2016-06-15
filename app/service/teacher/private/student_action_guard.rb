module Teacher::Private::StudentActionGuard
  
  private

  def can_add_student?
    return [false, 'have a student'] if student?

    [true, nil]
  end

  def can_add_room?
    return [false, 'not have a student'] if not_student?
    return [false, 'not have a room'] if not_room?
    return [false, 'student was on a room'] if student_room?

    [true, nil]
  end

  def can_add_subject?
    return [false, 'not have  a student'] if not_student?
    return [false, 'not have a subject'] if not_subject?
    return [false, 'student have a subject'] if student_subject?

    [true, nil]
  end

  def can_add_score?
    return [false, 'not have  a student'] if not_student?
    return [false, 'not have a subject'] if not_subject?
    return [false, 'student not have in a subject'] if not_student_subject?
    # return [false, 'student not have a score primary term'] if not_score_primary_term?
    # return [false, 'student not have a score secondary term'] if not_score_secondary_term?

    [true, nil]
  end 
  
  def can_add_grade?
    return [false, 'student not have a score primary term'] if not_score_primary_term?
    return [false, 'student not have a score secondary term'] if not_score_secondary_term?

    [true, nil]
  end

  def student_subject?
    subject.students.find_by(id: student.id)
  end

  def student_room?
    room.students.find_by(id: student.id)
  end

  def student?
    Student.find_by(iden_number: iden_number, first_name: first_name, last_name: last_name)
  end

  def not_student_subject?
    !subject.students.find_by(id: student.id)
  end

  def not_subject?
    !subject
  end

  def not_room?
    !room
  end

  def not_student?
    !student
  end

  def not_score_primary_term?
    !score_primary_term
  end

  def not_score_secondary_term?
    !score_secondary_term
  end


end