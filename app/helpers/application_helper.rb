module ApplicationHelper

  def room_id(room_id)
    room = Room.find_by(id: room_id).update_attributes(status: '1')
  end

  def current_room
    Room.find_by(status: '1')
  end

end
