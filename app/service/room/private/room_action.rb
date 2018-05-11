module Room::Private::RoomAction
  private 

  def process_add
    Room.create(params)
  end

  def process_edit
    current_room.update_attributes(params)
    current_room
  end

  def process_destroy
    current_room.destroy
  end
end