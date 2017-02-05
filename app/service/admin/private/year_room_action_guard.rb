module Admin::Private::YearRoomActionGuard

  def can_add?
    return [false, 'YearRoom have a exist'] if already_year_room_exist?

    [true, nil]
  end

  def can_edit?
    return [false, 'YearRoom not have a exist'] if not_already_year_room_exist?
    
    [true, nil]
  end

  def can_destroy?
    return [false, 'YearRoom not have a exist'] if not_already_year_room_exist?
    
    [true, nil] 
  end

  def already_year_room_exist?
    YearRoom.find_by(name: name)
  end

  def not_already_year_room_exist?
    !already_year_room_exist?
  end

end