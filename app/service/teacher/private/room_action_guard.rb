module Teacher::Private::RoomActionGuard

  def can_add?
    return [false, 'TeacherRoom already exist'] unless teacher_exist?

    [true, nil]
  end

  def can_edit?
    return [false, 'TeacherRoom not already exist'] unless not_teacher_exist?

    [true, nil]
  end

  def can_destroy?
    return [false, 'TeacherRoom not already exist'] unless not_teacher_exist?

    [true, nil]
  end

  def not_teacher_exist?
    current_teacher_room
  end

  def teacher_exist?
    !current_teacher_room
  end

  def current_teacher_room
    TeacherRoom.find_by(teacher_id: teacher_id, room_id: room_id)
  end


end