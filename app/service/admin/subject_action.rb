class Admin::SubjectAction

  attr_reader :course_list, :name, :code, :hour_per_year, :type, :room

  include Admin::Private::SubjectActionGuard
  include Admin::Private::SubjectAction

  def initialize(option = {})
    @course_list ||= option[:course_list]
    @room ||= option[:room]
  end

  def add(params)
    @name = params[:name]
    @code = params[:code]
    @type = params[:type]
    @hour_per_year = params[:hour_per_year]

    can_add, message = can_add?
    fail message unless can_add

    process_add
  end

  def add_student_subject
    process_add_student_subject
  end

end