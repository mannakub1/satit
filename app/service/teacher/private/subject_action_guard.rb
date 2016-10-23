module Teacher::Private::SubjectActionGuard

  private 

  def can_add?
    return [false, 'Course have exist subject'] unless subject_exist?
 
    [true, nil]
  end

  def can_edit?
    # return [false, 'Course do not exist subject'] unless subject_exist?

    [true, nil]
  end

  def subject_exist?
    !course_list.subjects.find_by(name: params[:name], code: params[:code])
  end

end