class Admin::YearRoomAction

  attr_reader :name, :year_room, :params

  include Admin::Private::YearRoomActionGuard
  include Admin::Private::YearRoomAction

  def initialize(option = {})
    @year_room ||= option[:year_room]
  end

  def add(params)
    puts 'in fuction add'
    @params = params
    @name = params[:name]

    can_add, message = can_add?
    fail message unless can_add

    puts 'in complete guard'
    process_add
    process_add_rooms
  end

  def edit(params)
    @params = params
    @name = @year_room.name

    can_edit, message = can_edit?
    fail message unless can_edit

    process_edit
  end

  def delete
    @name = @year_room.name
    
    can_destroy, message = can_destroy?
    fail message unless can_destroy

    process_destroy
  end


end