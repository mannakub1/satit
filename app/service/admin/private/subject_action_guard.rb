module Admin::Private::SubjectActionGuard

  private 

  def can_add?
    return [false, 'course is already subject'] unless already_subject?

    [true, nil]
  end

  def already_subject?
    !course_list.subjects.find_by(name: name, code: code, hour_per_year: hour_per_year, type: type)
  end

end