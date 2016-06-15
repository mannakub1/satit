module Teacher::Private::StudentAction

  private 

  def process_add_student
    Student.create(iden_number: iden_number, first_name: first_name, last_name: last_name)
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

  def student_subject
    StudentSubject.find_by(student_id: student.id, subject_id: subject.id)
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