module Admin::Private::SubjectAction

  private 

  def process_add
    course_list.subjects.create(name: name, code: code, hour_per_year: hour_per_year)
  end
end