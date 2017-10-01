module Student::Private::StudentAction

  private 

  def process_authenication
    return [false, 'Invalid email or password.'] unless valid_password?

    current_student_username
  end

  def process_add_picture
    student.update_attributes(params)
  end

  def valid_password?
    compare_password?
  end

  def process_delete
    student.update_attributes(delete_status: 'true')
  end

  def compare_password?
    current_student_username.authenticate(password_digest)
  end

  def current_student_username
    Student.find_by(username: username)
  end

  def process_add_student
    params[:username] = params[:code_number]
    params[:password] = params[:code_number]

    student = Student.create(params)
  end

  def process_add_room
    StudentRoom.create(student_id: student.id, room_id: room.id)
  end

  def process_add_subject
    StudentSubject.create(student_id: student.id, subject_id: subject.id)
  end

  def process_add_score
    student_subject.update_attributes(score_primary_term: score_primary_term, score_secondary_term: score_secondary_term)
  end

  def process_add_grade
    student_subject.update_attributes(grade: calculate_grade)
  end

  def process_edit
    student.update_attributes(params)
  end

  def change_room_state
    Student.find(student.id).update_attributes(room_state: true)
  end

  def student_subject
    StudentSubject.find_by(student_id: student.id, subject_id: subject.id)
  end

  def current_student
    Student.find(student.id)
  end

  def calculate_grade
    return 4.0 if calculate_score >= 80
    return 3.5 if calculate_score >= 75
    return 3.0 if calculate_score >= 70
    return 2.5 if calculate_score >= 65
    return 2.0 if calculate_score >= 60
    return 1.5 if calculate_score >= 55
    return 1.0 if calculate_score >= 50
    return 0  
  end

  def calculate_score
    (student_subject.score_primary_term + student_subject.score_secondary_term) / 2
  end
end