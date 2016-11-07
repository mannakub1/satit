module Satit::RoomAPI

  class CouresListEntity < Grape::Entity
    expose :id
    expose :room_level
    expose :rooms \
    , with: Satit::RoomAPI::RoomEntity
  end
end