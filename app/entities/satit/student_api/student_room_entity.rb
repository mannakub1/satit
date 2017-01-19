module Satit::StudentAPI

  class StudentRoomEntity < Grape::Entity
    expose :student \
    , with: Satit::StudentAPI::StudentListEntity
  end
end