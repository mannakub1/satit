module Admin::Private::StudentSubjectActionGuard

  private

  def can_add?
    return [false, 'Student is already subject'] unless subject_already?

    [true, nil]
  end

  def subject_already?
    !student_room.subjects.find_by(name: subject.name, code: subject.code, hour_per_year: subject.hour_per_year)
  end

end