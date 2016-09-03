module Teacher::Private::AdultActionGuard

  def can_add?
    return [false, adult] if adult?

    [true, nil]
  end

  def can_edit?
    return [false, 'not have a'] unless adult_by_ids?

    [true, nil]
  end

  def can_add_father?
    return [false, 'not have a id of adult'] unless father?
    return [false, 'have a father'] unless father_list?

    [true, nil]
  end

  def can_add_mother?
    return [false, 'not have a id of adult'] unless mother?
    return [false, 'have a mother'] unless mother_list?

    [true, nil]
  end

  def can_add_guardian?
    return [false, 'not have a id of adult'] unless guardian?
    return [false, 'have a guardain'] unless guardian_list?


    [true, nil]
  end

  def father_list?
    !FatherList.find_by(student_id: student.id)
  end

  def mother_list?
    !MotherList.find_by(student_id: student.id)
  end

  def guardian_list?
    !Guardian.find_by(student_id: student.id)
  end 

  def father?
    Adult.find_by(id: father_id)
  end

  def mother?
    Adult.find_by(id: mother_id)
  end

  def guardian?
    Adult.find_by(id: guardian_id)
  end

  def adult?
    adult
  end

  def adult_by_ids?
    Adult.find_by(id: id)
  end

  def adult 
    Adult.find_by(first_name: first_name, last_name: last_name)
  end
end