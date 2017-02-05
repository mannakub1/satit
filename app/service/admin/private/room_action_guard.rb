module Admin::Private::RoomActionGuard

  def can_add?
    return [false, 'room have a exist'] if room_exist?

    [true, nil]
  end

  def can_edit?
    return [false, 'room not have a exist'] if not_room_exist?

    [true, nil]
  end

  def can_destroy?
    return [false, 'room not have a exist'] if not_room_exist?

    [true, nil]
  end

  def room_exist?
    current_year_room.rooms.find_by(name: name)
  end 

  def not_room_exist?
    !current_room
  end

  def current_year_room
    year_room
  end

  def curret_room?
    room
  end

end