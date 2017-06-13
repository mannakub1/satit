module Admin::Private::YearRoomAction

  def process_add
    YearRoom.create(params)
  end

  def process_add_rooms
    year_room_new = YearRoom.last
    year_room_old = YearRoom.find_by(name: year_room_new.name.to_i - 1)
    
    room_1 = Admin::RoomAction.new(year_room: year_room_new).add(name: 'พุทธรักษา', level: 'ป.1', priority: 1, year: year_room_new.name)
    room_2 = Admin::RoomAction.new(year_room: year_room_new).add(name: 'ลีลาวดี', level: 'ป.1', priority: 2, year: year_room_new.name)
    room_3 = Admin::RoomAction.new(year_room: year_room_new).add(name: 'กระเช้าสีดา', level: 'ป.2', priority: 3, year: year_room_new.name)
    room_4 =  Admin::RoomAction.new(year_room: year_room_new).add(name: 'จ่ามงกุฎ', level: 'ป.2', priority: 4, year: year_room_new.name)
    room_5 = Admin::RoomAction.new(year_room: year_room_new).add(name: 'เพชรดี', level: 'ป.3', priority: 5, year: year_room_new.name)
    room_6 = Admin::RoomAction.new(year_room: year_room_new).add(name: 'มณีงาม', level: 'ป.3', priority: 6, year: year_room_new.name)
    room_7 = Admin::RoomAction.new(year_room: year_room_new).add(name: 'ร่มไทร', level: 'ป.4', priority: 7, year: year_room_new.name)
    room_8 = Admin::RoomAction.new(year_room: year_room_new).add(name: 'ใบโพธิ์', level: 'ป.4', priority: 8, year: year_room_new.name)
    room_9 = Admin::RoomAction.new(year_room: year_room_new).add(name: 'มหานที', level: 'ป.5', priority: 9, year: year_room_new.name)
    room_10 = Admin::RoomAction.new(year_room: year_room_new).add(name: 'ปถวีธร', level: 'ป.5', priority: 10, year: year_room_new.name)
    room_11 = Admin::RoomAction.new(year_room: year_room_new).add(name: 'แสงตะวัน', level: 'ป.6', priority: 11, year: year_room_new.name)
    room_12 = Admin::RoomAction.new(year_room: year_room_new).add(name: 'จันทร์กระจ่าง', level: 'ป.6', priority: 12, year: year_room_new.name)
  

    if year_room_old != nil
      process_add_student(year_room_old, 'พุทธรักษา', room_3)
      process_add_student(year_room_old, 'ลีลาวดี', room_4)
      process_add_student(year_room_old, 'กระเช้าสีดา', room_5)
      process_add_student(year_room_old, 'จ่ามงกุฎ', room_6)

      process_add_student(year_room_old, 'ร่มไทร', room_9)
      process_add_student(year_room_old, 'ใบโพธิ์', room_10)
      process_add_student(year_room_old, 'มหานที', room_11)
      process_add_student(year_room_old, 'ปถวีธร', room_12)
    end

    year_room_new.rooms
  end


  def process_add_student(year_room_old, name, room)
    year_room_old.rooms.find_by(name: name).students.each do |student|
      Teacher::StudentAction.new(student: student).add_room(room)
    end
  end

  def process_edit
    current_year_room.update_attributes(params)
  end

  def process_destroy
    current_year_room.destroy
  end

  def current_year_room
    year_room
  end

end