module Admin::Private::AdminActionGuard

  private 

  def can_authenication?
    return [false, 'Invalid email or password1.'] if username?
    return [false, 'Invalid email or password2.'] if password?
    # return [false, 'Invalid email or password3.'] if admin?

    [true, nil]
  end

  def username?
    username.nil?
  end

  def password?
    password_digest.nil?
  end

  def admin?
    !Admin.find_by(username: username)
  end
end