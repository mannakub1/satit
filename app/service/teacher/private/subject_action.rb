module Teacher::Private::SubjectAction

  private 

  def process_add
    subject = current_course_list.subjects.create(params)
    Student::SubjectAction.new(course_list_id: course_list_id).add
    subject
  end

  def process_add_room
    current_course_list.course_rooms.create(room_id: room_id)
    Student::SubjectAction.new(course_list_id: course_list_id).add
    current_course_list

  end

  def process_edit
    
    current_subject1.update_attributes(params)

    current_subject1
  end

  def process_add_teacher
    TeacherCourse.create(subject_id: subject_id, teacher_id: params)
  end

  def process_delete_teacher
    current_teacher_course.destroy
  end

  def current_teacher_course
    TeacherCourse.find_by(subject_id: subject_id, teacher_id: params)
  end

  def current_subject1
    Subject.find(subject_id)
  end

  def teacher_grade
    TeacherGrade.where(teacher_id: teacher.id, student_subject_id: student_subject.id).last
  end

  def add_teacher_grade
    TeacherGrade.create(teacher_id: teacher.id, student_subject_id: student_subject.id, score1: score1, score2: score2)
  end

  def process_edit_score

    add_teacher_grade

    if teacher_grade.score2.to_i > 0.0 && teacher_grade.score1.to_i > 0.0
      puts '5555'
      teacher_grade.update_attributes(grade: c_grade, score_result: result_score, status_grade: true)
    elsif teacher_grade.score2.to_i > 0.0
      teacher_grade.update_attributes(grade: grade2, score_result: result_score2 , status_grade: true)
    elsif teacher_grade.score2.to_i == 0
      teacher_grade.update_attributes(grade: grade)
    end

    student_subject.update_attributes(score1: teacher_grade.score1, score2: teacher_grade.score2, grade: teacher_grade.grade\
    , score_result: teacher_grade.score_result, status_grade: true)
    update_gpa

    student.student_rooms.order(:created_at)
  end

  def update_gpa
    cp = 0
    ca = 0
    gp = 0
    gpa = 0
    count = 0
    student.student_rooms.order(:level).each do |student_room|
        puts "test update #{student_room.level}"
        if current_student_room_level? && student_room_level(student_room)
            count = count + 1
            student_room.student_subjects.each do |std|
              grade = std.grade
              credit = std.subject.credit 
              if std.score2.to_f > 0.0
                ca = ca + credit.to_f
                gp = gp + (credit.to_f * grade.to_f)
                if grade != 0 
                  cp = cp + credit.to_f
                end
              end
            end
        elsif not_current_student_room_level?
           count = count + 1
            student_room.student_subjects.each do |std|
              grade = std.grade
              credit = std.subject.credit 
              if std.score2.to_f > 0.0
                ca = ca + credit.to_f
                gp = gp + (credit.to_f * grade.to_f)
                if grade != 0 
                  cp = cp + credit.to_f
                end
              end
            end
        end
      end
    puts "count = #{count}"
    if count > 0 && ca != 0
      puts 'test update'
      current_student_room.update_attributes(cp: cp, ca: ca, gp: gp, gpa: gp / ca)
    end
  end

  def not_current_student_room_level?
    !current_student_room_level? 
  end

  def current_student_room_level? 
    current_student_room.level == "ป.4" || current_student_room.level == "ป.5" || current_student_room.level == "ป.6"
  end

  def student_room_level(student_room)
    student_room.level == "ป.4" || student_room.level == "ป.5" || student_room.level == "ป.6" 
  end

  def current_subject
    student_subject.subject
  end

  def current_student_room
    student_subject.student_room
  end

  def current_course_list
    CourseList.find_by(id: course_list_id)
  end

  def c_grade
    puts '6666'
    return "4" if result_score >= 80
    return '3.5' if result_score >= 75
    return '3' if result_score >= 70
    return '2.5' if result_score >= 65
    return '2' if result_score >= 60
    return '1.5' if result_score >= 55
    return '1' if result_score >= 50
    return '0' if result_score < 50
  end

   def grade2
    return "4" if result_score2 >= 80
    return '3.5' if result_score2 >= 75
    return '3' if result_score2 >= 70
    return '2.5' if result_score2 >= 65
    return '2' if result_score2 >= 60
    return '1.5' if result_score2 >= 55
    return '1' if result_score2 >= 50
    return '0' if result_score2 < 50
  end

  def result_score
    (teacher_grade.score1.to_i + teacher_grade.score2.to_i) / 2.0 
  end

  def result_score2
     teacher_grade.score2.to_i
  end
end