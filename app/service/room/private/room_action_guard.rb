module Room::Private::RoomActionGuard

  private 

  def can_add?
     return [false, 'this year_room_id don\'t have exist '] unless current_year_room

    [true, nil]
  end

  def can_edit?
    return [false, 'this year_room_id don\'t have exist '] unless current_year_room
    return [false, 'this room_id don\'t have exist '] unless current_room

    [true, nil]
  end

  def can_destroy?
    return [false, 'this year_room_id don\'t have exist '] unless current_year_room
    return [false, 'this room_id don\'t have exist '] unless current_room

    [true, nil]
  end

end