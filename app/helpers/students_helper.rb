module StudentsHelper

  def room_id(room_id)
    session[:room_id] = room_id
  end

  def current_room
    @room ||= Room.find_by(id: session[:room_id])
  end
end
