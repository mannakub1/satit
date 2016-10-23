module Satit::SubjectAPI

  class SubjectListEntity < Grape::Entity
    expose :code
    expose :name
    expose :type
    expose :hour_per_year
    expose :credit
  end

end