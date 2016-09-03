module Room::Private::RoomActionGuard

  private 

  def can_add?
    # return [false, 'do not have a name'] if name?
    # return [false, 'do not have a level'] if level?
    # return [false, 'do not have a year'] if year?
    return [false, 'had aroom'] if room?

    [true, nil]
  end

  def room?
    Room.find_by(name: name, level: level, year: year)
  end

  # def name?
  #   puts name
  #   name
  # end

  # def level?
  #   level
  # end

  # def year?
  #   year
  # end

end