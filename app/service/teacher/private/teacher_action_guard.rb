module Teacher::Private::TeacherActionGuard

  def can_authenication?
    return [false, 'not teacher'] unless teacher?
    return [false, 'Invalid email or password.'] unless username?
    return [false, 'Invalid email or password.'] unless password?
    # return [false, 'Invalid email or password3.'] if admin?

    [true, nil]
  end

  def teacher?
    Teacher.find_by(username: username)
  end

  def username?
    username
  end

  def password?
    password_digest
  end 

end