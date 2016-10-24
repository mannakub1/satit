module Teacher::Private::TeacherAction

  def process_authenication
    return [false, 'Invalid email or password.'] if valid_password?
    
    current_teacher
  end

  def process_add
    Teacher.create(params)
  end

  def process_edit
    current_teacher.update_attributes(params)
  end

  def process_delete
    current_teacher_ids.update_attributes(resign: false)
  end

  def valid_password?
    !compare_password?
  end

  def compare_password?
    current_teacher.authenticate(password_digest)
  end

  def current_teacher_ids
    Teacher.present.find_by(id: teacher_id)
  end

  def current_teacher
    Teacher.present.find_by(username: username)
  end


end