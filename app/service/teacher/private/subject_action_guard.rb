module Teacher::Private::SubjectActionGuard

  private 

  def can_edit?
    return [false, 'Course do not exist subject'] unless subject_exist?

    [true, nil]
  end

  def subject_exist?
    
  end
end