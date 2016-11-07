module Satit::SubjectAPI

  class CourseListsListEntity < Grape::Entity
    expose :id
    expose :room_level
    expose :full_name
    # expose :subjects \
    # , with: Satit::SubjectAPI::SubjectListEntity
    # expose :rooms \
    # , with: Satit::RoomAPI::RoomEntity
  end

end