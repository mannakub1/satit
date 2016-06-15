class Teacher::StudentAction
  
  attr_reader :teacher, :student, :room, :subject, :iden_number, :first_name, :last_name, :score_primary_term, :score_secondary_term

  include Teacher::Private::StudentAction
  include Teacher::Private::StudentActionGuard

  def initialize(student)
    @student = student
    @teacher = Teacher.find(1)
  end


  def add_student(iden_number, first_name, last_name)

    @iden_number = iden_number
    @first_name = first_name
    @last_name = last_name

    can_add_student, message = can_add_student?
    fail message unless can_add_student

    process_add_student
  end
  
  def add_room(room)
    @room = room

    can_add_room, message = can_add_room?
    fail message unless can_add_room

    process_add_room
  end

  def add_subject(subject)
    @subject = subject

    can_add_subject, message = can_add_subject?
    fail message unless can_add_subject

    process_add_subject
  end

  def add_score(subject, score_primary_term, score_secondary_term)
    @subject = subject
    @score_primary_term = score_primary_term
    @score_secondary_term = score_secondary_term

    can_add_score, message = can_add_score?
    fail message unless can_add_score

    process_add_score
    add_grade
    # student_subjects.update_attributes(score: score)
  end

  def add_grade
    can_add_grade, message = can_add_grade?
    fail message unless can_add_grade

    process_add_grade
  end

  # def add_grade(grade)
  #   subject.update_attributes(grade: grade)
  # end

  # def subject_student
  #   student.student_subjects.find(id_subject)
  # end

end