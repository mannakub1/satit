module Satit::SubjectAPI

  class SubjectListEntity < Grape::Entity
    expose :code
    expose :name
    expose :hour_per_year
    expose :type
  end

end