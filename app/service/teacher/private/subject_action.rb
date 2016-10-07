module Teacher::Private::SubjectAction

  private 

  def process_edit
    student_subject.update_attributes(score1: score1, score2: score2)

    if(student_subject.score2 > 0) 
      student_subject.update_attributes(grade: grade)
    end

    student.student_rooms
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
    student_subject.score1 + student_subject.score2
  end
end