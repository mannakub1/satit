module Satit::TeacherAPI::Student

  class RoomListEntity < Grape::Entity
    expose :id
    expose :level
    expose :name
    expose :year
  end
end