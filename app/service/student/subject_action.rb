class Student::SubjectAction

  attr_reader :student, :id_subject

  def initialize(student, id_subject)
    @student = student
    @id_subject = id_subject
  end

  
  def add_score(score)  
    subject.update_attributes(score: score)
  end

  def add_grade(grade)
    subject.update_attributes(grade: grade)
  end

  def subject
    student.student_subjects.find(id_subject)
  end

end