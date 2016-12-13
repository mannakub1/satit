module Satit::StudentAPI

  class RoomListEntity < Grape::Entity
    expose :id
    expose :level
    expose :name
    expose :year
    expose :students \
    , with: Satit::StudentAPI::StudentListEntity
  end
end