module Teacher::Private::CourseAction

  def process_add
    Course.create(params)

    create_course_lists
  end

  def create_course_lists
    current_course.course_lists.create(room_level: 'ป.1', full_name: 'ชั้นมัธยมศึกษาปีที่1')
    current_course.course_lists.create(room_level: 'ป.2', full_name: 'ชั้นมัธยมศึกษาปีที่2')
    current_course.course_lists.create(room_level: 'ป.3', full_name: 'ชั้นมัธยมศึกษาปีที่3')
    current_course.course_lists.create(room_level: 'ป.4', full_name: 'ชั้นมัธยมศึกษาปีที่4')
    current_course.course_lists.create(room_level: 'ป.5', full_name: 'ชั้นมัธยมศึกษาปีที่5')
    current_course.course_lists.create(room_level: 'ป.6', full_name: 'ชั้นมัธยมศึกษาปีที่6')  
  end

  def current_course
    Course.last
  end

end