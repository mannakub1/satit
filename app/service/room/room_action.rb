class Room::RoomAction

  attr_reader :name, :year, :level

  include Room::Private::RoomAction
  include Room::Private::RoomActionGuard

  def initialize(option = {})
    @name = option[:name] || nil
    @year = option[:year] || nil
    @level = option[:level] || nil

    puts @name
  end

  def add

    can_add, message = can_add?
    fail message unless can_add

    process_add
  end

end