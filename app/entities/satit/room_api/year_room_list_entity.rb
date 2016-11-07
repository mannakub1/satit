module Satit::RoomAPI
  
  class YearRoomListEntity < Grape::Entity
    expose :id
    expose :name
    expose :rooms \
    , with: Satit::RoomAPI::RoomListEntity
  end

end