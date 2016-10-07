class Admin::CourseAction

  attr_reader :year

  include Admin::Private::CourseActionGuard
  include Admin::Private::CourseAction

  def initialize(option = {})

  end


  def add(year)
    @year = year

    can_add, message = can_add?
    fail message unless can_add

    process_add
  end
end