module Teacher::Private::CourseActionGuard

  def can_add?
    return [false, 'Course have a exist'] unless already_course?

    [true, nil]
  end

  def already_course?
    !current_course_by_year
  end

  def current_course_by_year
    Course.find_by(year: params[:year])
  end
end