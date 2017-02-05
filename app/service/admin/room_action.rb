class Admin::RoomAction

  attr_reader :year_room, :name, :room, :level, :year, :priority, :params

  include Admin::Private::RoomActionGuard
  include Admin::Private::RoomAction

  def initialize(option = {})
    @year_room ||= option[:year_room]
    @room ||= option[:room]
  end

  def add(params)
    @params = params
    @name = params[:name]

    can_add, message = can_add?
    fail message unless can_add

    process_add
  end

  def edit(params)
    @params = params
    @name = @room.name

    can_edit, message = can_edit?
    fail message unless can_edit

    process_edit
  end

  def delete
    @name = @room.name
    
    can_destroy, message = can_destroy?
    fail message unless can_destroy

    process_destroy
  end

end