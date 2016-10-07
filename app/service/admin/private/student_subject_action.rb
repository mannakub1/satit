module Admin::Private::StudentSubjectAction

  private 

  def process_add
    student_room.student_subjects.create(subject_id: subject.id)
  end
  
end