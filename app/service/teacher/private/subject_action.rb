module Teacher::Private::SubjectAction

  private 

  def process_add
    subject = current_course_list.subjects.create(params)
    Student::SubjectAction.new(course_list_id: course_list_id).add
    subject
  end

  def process_add_room
    current_course_list.course_rooms.create(room_id: room_id)
    Student::SubjectAction.new(course_list_id: course_list_id).add
    current_course_list

  end

  def process_edit
    current_subject.update_attributes(params)

    current_subject
  end

  def process_add_teacher
    TeacherCourse.create(subject_id: subject_id, teacher_id: params)
  end

  def process_delete_teacher
    current_teacher_course.destroy
  end

  def current_teacher_course
    TeacherCourse.find_by(subject_id: subject_id, teacher_id: params)
  end

  def current_subject
    Subject.find_by(id: subject_id)
  end

  def process_edit_score
    student_subject.update_attributes(score1: score1, score2: score2)

    if student_subject.score2.to_i > 0.0
      student_subject.update_attributes(grade: grade, score_result: (score1 + score2) / 2.0)
    end

    if student_subject.score2.to_i == 0.0
      student_subject.update_attributes(grade: '')
    end


    student.student_rooms.order(:created_at)
  end

  def current_course_list
    CourseList.find_by(id: course_list_id)
  end

  def grade
    return '4' if result_score >= 80
    return '3.5' if result_score >= 75
    return '3' if result_score >= 70
    return '2.5' if result_score >= 65
    return '2' if result_score >= 60
    return '1.5' if result_score >= 55
    return '1' if result_score >= 50
    return '0' if result_score < 50
  end

  def result_score
    (student_subject.score1.to_i + student_subject.score2.to_i) / 2.0 
  end
end