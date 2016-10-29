module Satit::SubjectAPI

  class SubjectListEntity < Grape::Entity
    expose :id
    expose :code
    expose :name
    expose :status
    expose :credit
    expose :hour_per_year
    expose :credit
  end

end