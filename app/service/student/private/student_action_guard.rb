module Student::Private::StudentActionGuard
  
  private

  def can_add_student?
    return [false, 'not have a code number'] if not_code_number?
    return [false, 'not hava a first name'] if not_first_name?
    return [false, 'not have a last_name'] if not_last_name?
    return [false, 'have a student'] if student?

    [true, nil]
  end

  def can_add_picture?
    return [false, 'have a student'] if student? 
  end

  def can_delete?
    return [false, 'not have exist student'] if not_student_exist?

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

  def can_edit
    return [false, 'not have  a student'] if not_student_by_ids?

    [true, nil]
  end

  def can_authenication?
    return [false, 'Invalid email or password'] unless student_username?
    return [false, 'Invalid email or password'] unless username?
    return [false, 'Invalid email or password'] unless password?
    # return [false, 'Invalid email or password3.'] if admin?

    [true, nil]
  end

  def student_username?
    Student.find_by(username: username)
  end

  def not_student_exist?
    !Student.find_by(id: student.id)
  end

  def username?
    !username.nil?
  end

  def password?
    !password_digest.nil?
  end 

  def student_subject?
    subject.students.find_by(id: student.id)
  end

  def student_room?
    room.students.find_by(id: student.id)
  end

  def student?
    Student.find_by(code_number: code_number, first_name: first_name, last_name: last_name)
  end

  def student_ids?
    Student.find_by(id: id)
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

  def not_code_number?
    !code_number 
  end

  def not_first_name?
    !first_name
  end

  def not_last_name?
    !last_name
  end

  def not_student_by_ids?
    !student_ids
  end

end