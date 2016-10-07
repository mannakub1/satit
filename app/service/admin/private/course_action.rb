module Admin::Private::CourseAction

  private 

  def process_add
    Course.create(year: year)
  end

end