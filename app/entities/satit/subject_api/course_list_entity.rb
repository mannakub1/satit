module Satit::SubjectAPI

  class CourseListEntity < Grape::Entity
    expose :id
    expose :year
  end

end