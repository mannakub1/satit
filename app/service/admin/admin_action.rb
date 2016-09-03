class Admin::AdminAction

  attr_reader :params, :username, :password_digest, :token
  
  include Admin::Private::AdminAction
  include Admin::Private::AdminActionGuard

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

  def check_token(params_token)
    @token = ApiKey.find_by(access_token: params_token)
    if @token && !@token.expired?
      set_time_expiration
      return Admin.find(token.admin_id) if admin?
      return Student.find(token.student_id) if student?
    else
      false
    end
  end

  def logout(params_token)
    @token = ApiKey.find_by(access_token: params_token)

    if @token
      set_expiration_out
      { status: 'true' }
    else
      { status: 'false' } 
    end

  end 

  

  def admin?
    Admin.find(token.admin_id) 
  end

  def student?
    Student.find(token.student_id)
  end

  def set_expiration_out
    @token.update_attributes(expires_at: DateTime.now.utc)
  end

  def set_time_expiration
    @token.update_attributes(expires_at: DateTime.now.utc + 30.minutes)
  end
end