module Admin::Private::CourseActionGuard

  private 

  def can_add?
    return [false, 'This shool already is course'] unless already_course?

    [true, nil]
  end

  def already_course?
    !Course.find_by(year: year)
  end
end