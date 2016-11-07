class Teacher::CourseAction
  attr_reader :params

  include Teacher::Private::CourseActionGuard
  include Teacher::Private::CourseAction

  def initialize(option = {})

  end

  def add(params)
    @params = params

    can_add, message = can_add?
    fail message unless can_add

    process_add
  end

  # def edit(params)

  #   can_edit, message = can_edit?
  #   fail messgae unless can_edit

  #   process_edit
  # end
end