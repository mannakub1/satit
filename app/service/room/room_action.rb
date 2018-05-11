class Room::RoomAction

  attr_reader :name, :year, :level, :params

  include Room::Private::RoomAction
  include Room::Private::RoomActionGuard

  def initialize(option = {})
    @year_room_id = option[:year_room_id]
    @room_id = option[:room_id]
  end

  def add(params = {})
    @params = params
    puts params

    can_add, message = can_add?
    fail message unless can_add

    process_add
  end

  def edit(params = {})
    @params = params

    can_edit, message = can_edit?
    fail message unless can_edit

    process_edit
  end

  def destroy
    can_destroy, message = can_destroy?
    fail message unless can_destroy
    
    process_destroy
  end

  def current_room
    Room.find_by(id: @room_id)
  end

  def current_year_room
    YearRoom.find_by(id: @year_room_id)
  end
end