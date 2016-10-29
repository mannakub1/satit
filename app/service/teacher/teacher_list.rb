class Teacher::TeacherList

  def initialize(option = {})

  end

  def present
    Teacher.present
  end

  def teacher_spec
    Teacher.present.where(status: 'teacher')
  end
end