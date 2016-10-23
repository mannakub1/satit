module Teacher::Private::TeacherActionGuard

  def can_authenication?
    return [false, 'not teacher'] unless teacher?
    return [false, 'Invalid email or password.'] unless username?
    return [false, 'Invalid email or password.'] unless password?
    # return [false, 'Invalid email or password3.'] if admin?

    [true, nil]
  end

  def can_add?
    return [false, 'this username is already'] unless already_username?
    return [false, 'this teacher is already'] unless already_teacher?

    [true, nil]
  end

  def can_edit?
    return [false, 'have not teacher is already'] unless not_already_teacher?

    [true, nil]
  end

  def not_already_teacher?
    !already_teacher?
  end

  def already_teacher?
    !Teacher.find_by(first_name: params[:first_name], last_name: params[:last_name], username: params[:username])
  end

  def teacher?
    Teacher.find_by(username: username)
  end

  def username?
    username
  end

  def already_username?
    !Teacher.find_by(username: params[:username])
  end

  def password?
    password_digest
  end 

end