class Teacher::RoomList

  attr_reader :teacher_id

  def initialize(option = {})
    @teacher_id = option[:teacher_id]
  end

  def room
    room_list = []
    TeacherRoom.present.where(teacher_id: @teacher_id).each { |teacher_room| room_list << teacher_room.room }

    room_list
  end

end