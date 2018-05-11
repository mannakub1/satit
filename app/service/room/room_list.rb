class Room::RoomList

  attr_reader :year, :params, :year_room_id

  def initialize(option = {})
    @year ||= option[:year]
    @year_room_id ||= option[:year_room_id]
  end

  def present 
    Room.find_by(year: DateTime.now.year.to_i + 543)
  end

  def by_ids(params)
    Room.find_by(id: params)
  end

  def students(params)
    @params = params

    current_room.students
  end

  def rooms_by_year_room_ids
    current_year_room.rooms.order('level').order('created_at')
  end

  def current_year_room
    YearRoom.find_by(id: @year_room_id)
  end

  def year_room_all
    YearRoom.all.order('name DESC')
  end

  def current_room
    Room.find_by(id: params)
  end
end