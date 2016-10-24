class Teacher::TeacherAction

  attr_reader :username, :password_digest, :params, :teacher_id


  include Teacher::Private::TeacherActionGuard
  include Teacher::Private::TeacherAction

  def initialize(option = {})
    @params ||= option[:params]
    @teacher_id ||= option[:id]
  end


  def authenication
    @username = @params[:username].downcase
    @password_digest = @params[:password]

    can_authenication, message = can_authenication?
    fail message unless can_authenication

    process_authenication
  end

  def add(params)
    @params = params

    can_add, message = can_add?
    fail message unless can_add

    process_add
  end

  def edit(params)
    @username = params[:username]
    @params = params

    can_edit, message = can_edit?
    fail messgae unless can_edit

    process_edit
  end

  def delete
    can_delete, message = can_delete?
    fail message unless can_delete

    puts '5555'
    process_delete
  end

end