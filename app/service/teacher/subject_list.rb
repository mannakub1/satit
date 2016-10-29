class Teacher::SubjectList

  attr_reader :course_id, :course_list_id

  def initialize(option = {})
    @subject_id ||= option[:subject_id]
    @course_id ||= option[:course_id]
    @course_list_id ||= option[:course_list_id]
  end

  def courses
    Course.all
  end

  def course_lists
    current_course.course_lists
  end

  def subjects
    current_course_list.subjects
  end 

  def course_rooms
    current_course_list.rooms
  end

  def subject_by_ids
    current_subject
  end

  def teacher_courses
    current_subject.teachers
  end

  def current_subject
    Subject.find_by(id: @subject_id)
  end

  def current_course
    Course.find_by(id: @course_id)
  end

  def current_course_list
    CourseList.find_by(id: @course_list_id)
  end
end