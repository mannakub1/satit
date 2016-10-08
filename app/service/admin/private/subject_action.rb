module Admin::Private::SubjectAction

  private 

  def process_add
    course_list.subjects.create(name: name, code: code, hour_per_year: hour_per_year, type: type)
  end

  def process_add_student_subject
    course_list.subjects.each do |subject| 
      room.student_rooms.each do |student|
        student.student_subjects.where(subject_id: subject.id).first_or_create!
      end
    end
  end
end