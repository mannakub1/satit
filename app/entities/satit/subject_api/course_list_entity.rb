module Satit::SubjectAPI

  class CourseListEntity < Grape::Entity
    expose :id
    expose :year
    expose :course_lists\
    , with: Satit::SubjectAPI::CourseListsListEntity
  end

end