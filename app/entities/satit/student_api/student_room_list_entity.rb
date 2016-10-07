module Satit::StudentAPI

  class StudentRoomListEntity < Grape::Entity
    expose :student_subjects, with: Satit::StudentAPI::StudentSubjectListEntity
    expose :room, with: Satit::RoomAPI::RoomListEntity
  end
end