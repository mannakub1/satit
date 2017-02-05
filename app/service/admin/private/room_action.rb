module Admin::Private::RoomAction

  def process_add
    current_year_room.rooms.create(params)
  end

  def process_edit
    current_room.update_attributes(params)
  end

  def process_destroy
    current_room.destroy
  end

  def current_year_room
    year_room
  end

  def current_room
    room
  end

end