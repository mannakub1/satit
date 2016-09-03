class Room::RoomList

  attr_reader :year

  def initialize(option = {})
    @year = option[:year] || nil
  end

  def present 
    Room.find_by(year: DateTime.now.year)
  end

end