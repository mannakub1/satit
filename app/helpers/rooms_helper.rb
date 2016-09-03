module RoomsHelper

  def room_id(room_id)
    room = Room.find_(room_id)
    room.attributes_update(status: '1')
  end

  def current_room
    Room.find_by(status: '1')
  end


end
