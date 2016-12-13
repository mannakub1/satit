class Teacher::RoomAction

  include Teacher::Private::RoomAction
  include Teacher::Private::RoomActionGuard

  attr_reader :teacher_id, :room_id

  def initialize(option = {})
    @teacher_id = option[:teacher_id]
    @room_id = option[:room_id]
  end

  def add

    can_add, message = can_add?
    fail message unless can_add

    process_add
  end

  def edit

    can_edit, message = can_edit?
    fail message unless can_edit

    process_edit
  end

  def destroy

    can_destroy, message = can_destroy?
    fail message unless can_destroy

    process_destroy
  end

end