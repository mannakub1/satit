module Satit::SubjectAPI

  class SubjectListEntity < Grape::Entity
    expose :code
    expose :name
    expose :status
    expose :hour_per_year
    expose :credit
  end

end