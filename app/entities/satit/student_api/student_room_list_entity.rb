module Satit::StudentAPI

  class StudentRoomListEntity < Grape::Entity
    expose :student_subjects, with: Satit::StudentAPI::StudentSubjectListEntity
    expose :room, with: Satit::RoomAPI::RoomListEntity
    expose :cr
    expose :cp
    expose :ca
    expose :gp
    expose :gpa
    expose :crx
    expose :cpx
    expose :cax
    expose :gpx
    expose :gpax
  end
end