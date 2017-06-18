class Teacher::RoomList

  attr_reader :teacher_id

  def initialize(option = {})
    @room_id = option[:room_id]
    @teacher_id = option[:teacher_id]
  end

  def room
    room_list = []
    TeacherRoom.present.where(teacher_id: @teacher_id).each { |teacher_room| room_list << teacher_room.room }

    room_list
  end

  def teacher_class
    puts current_room.teachers
    current_room.teachers.first
  end

  def current_room
    Room.find(@room_id)
  end

end