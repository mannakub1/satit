module Teacher::Private::StudentAction

  private 

  def process_authenication
    return [false, 'Invalid email or password.'] unless valid_password?

    current_student_username
  end

  def process_edit_image
    image = params[:params][:image][:tempfile]
    
    create_directory_store
    create_image(image)
    

    student_image = "public/picture/#{year}/#{student_id}_image.png"
    student_thumb = "public/picture/#{year}/#{student_id}_image.png"

    student_id.update_attributes(image: student_image, thumb: student_thumb)
  end

  def create_image(image)
    f = File.open("/Users/manny/Documents/_Work/ruby/satit/public/picture/#{year}/#{student_id}_image.png", 'w')
      f.write(image.read.to_s.force_encoding("UTF-8"))
    f.close
  end 

  def create_directory_store
    `mkdir public/picture/#{year}`
  end

  def year
    year = Student.find(student_id).student_rooms.first.room.year
  end


  def valid_password?
    compare_password?
  end

  def compare_password?
    current_student_username.authenticate(password_digest)
  end

  def current_student_username
    Student.find_by(username: username)
  end

  def process_add_student
    params[:username] = params[:code_number]
    params[:password] = params[:code_number]

    student = Student.create(params)
    process_create_grade(student)

    student
  end

  def process_create_grade(student)
    student.grades.create(status: 'primary')
    student.grades.create(status: 'secondary')
  end

  def process_add_room
    student_room = StudentRoom.create(student_id: student.id, room_id: room.id, level: room.level, code_number: student.code_number)
    
    if Course.find_by(year: room.year_room.name) != nil
      Course.find_by(year: room.year_room.name).course_lists.find_by(room_level: room.level).subjects.each do |subject|
        Teacher::StudentAction.new(student_room: student_room, subject: subject).add_subject
      end
    end
  end

  def process_student_room_delete
    student_room.update_attributes(student_status: false)
  end

  def process_add_subject
    StudentSubject.create(student_room_id: student_room.id, subject_id: subject.id)
  end

  def process_add_score
    student_subject.update_attributes(score_primary_term: score_primary_term, score_secondary_term: score_secondary_term)
  end

  def process_add_grade
    student_subject.update_attributes(grade: calculate_grade)
  end

  def process_edit
    student.update_attributes(params)
  end

  def change_room_state
    Student.find(student.id).update_attributes(room_state: true)
  end

  def student_subject
    StudentSubject.find_by(student_id: student.id, subject_id: subject.id)
  end

  def current_student
    Student.find(student.id)
  end

  def calculate_grade
    return 4.0 if calculate_score >= 80
    return 3.5 if calculate_score >= 75
    return 3.0 if calculate_score >= 70
    return 2.5 if calculate_score >= 65
    return 2.0 if calculate_score >= 60
    return 1.5 if calculate_score >= 55
    return 1.0 if calculate_score >= 50
    return 0  
  end

  def calculate_score
    (student_subject.score_primary_term + student_subject.score_secondary_term) / 2
  end
end