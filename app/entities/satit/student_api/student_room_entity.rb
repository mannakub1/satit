module Satit::StudentAPI

  class StudentRoomEntity < Grape::Entity
    expose :id
    expose :student \
    , with: Satit::StudentAPI::StudentListEntity
  end
end