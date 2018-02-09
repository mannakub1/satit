module Teacher::Private::RoomAction

  def process_add
    current_room.teachers.destroy_all
    process_finish if current_year && YearRoom.all.map(&:name).max != current_year.name && current_teacher_room_by_teacher

    TeacherRoom.create(teacher_id: teacher_id, room_id: room_id, status: true)
    current_teacher
  end

  def process_edit
    current_teacher_room.update_attributes(teacher_id: teacher_id, room_id: room_id)
  end

  def process_destroy
    current_teacher_room.destroy
  end

  def process_finish
    current_teacher_room_by_teacher.update_attributes(status: false)
  end

  def current_teacher
    Teacher.find(teacher_id)
  end

  def current_teacher_room
    TeacherRoom.find_by(teacher_id: teacher_id, room_id: room_id)
  end

  def current_teacher_room_by_teacher
    TeacherRoom.find_by(teacher_id: teacher_id)
  end

  def current_room
    Room.find_by(id: room_id)
  end

  def current_year
    YearRoom.find_by(id: current_room.year_room_id)
  end
end