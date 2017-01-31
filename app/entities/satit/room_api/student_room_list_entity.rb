module Satit::RoomAPI

  class StudentRoomListEntity < Grape::Entity
    expose :id
    expose :student, with: Satit::TeacherAPI::Student::StudentListEntity
    expose :room, with: Satit::RoomAPI::RoomListEntity
    
  end
end