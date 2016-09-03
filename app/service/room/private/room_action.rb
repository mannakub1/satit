module Room::Private::RoomAction

  private 

  def process_add
    Room.create(name: name, level: level, year: year)
  end

end