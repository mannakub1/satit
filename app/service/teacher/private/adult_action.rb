module Teacher::Private::AdultAction

  def process_add
    Adult.create(params)
  end

  def process_edit
    params.delete(:id)
    current_adult.update_attributes(params)

    current_adult
  end

  def process_add_father
    student.father_lists.create(adult_id: father_id)
  end

  def process_add_mother
    student.mother_lists.create(adult_id: mother_id)
  end

  def process_add_guardian
    student.guardians.create(adult_id: guardian_id)
  end

  def current_adult
    Adult.find_by(id: adult_id)
  end

end