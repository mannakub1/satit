class Teacher::SubjectAction

  attr_reader :score1, :score2, :student_subject, :student

  include Teacher::Private::SubjectAction

  def initialize(option = {})
    @student = option[:student]
    @student_subject = option[:student_subject]
  end

  def edit_score(score1, score2)
    puts '555555'
    @score1 = score1
    @score2 = score2

    # can_edit, message = can_edit?
    # fail message unless can_edit
    
    process_edit
  end

end