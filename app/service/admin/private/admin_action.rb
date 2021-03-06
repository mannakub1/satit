module Admin::Private::AdminAction

  private

  def process_authenication
    puts 'test called fuction process_authenication'
    puts current_admin
    return [false, 'Invalid email or password.'] if valid_password?
    puts 'username password of api correct'
    key = ApiKey.create(admin_id: current_admin.id)
    { status: true, token: key.access_token }
  end

  def valid_password?
    !compare_password?
  end

  def compare_password?
    current_admin.authenticate(password_digest)
  end

  def current_admin
    Admin.find_by(username: username)
  end
end