class Teacher::TeacherAction

  attr_reader :username, :password_digest


  include Teacher::Private::TeacherActionGuard
  include Teacher::Private::TeacherAction

  def initialize(option = {})
    @params ||= option[:params]
  end


  def authenication
    @username = @params[:username].downcase
    @password_digest = @params[:password]

    can_authenication, message = can_authenication?
    fail message unless can_authenication

    process_authenication
  end

end