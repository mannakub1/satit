module Satit::RoomAPI

  class RoomEntity < Grape::Entity
    expose :id
    expose :level
    expose :name
    expose :year
    expose :students \
    , with: Satit::StudentAPI::StudentListEntity
  end
end