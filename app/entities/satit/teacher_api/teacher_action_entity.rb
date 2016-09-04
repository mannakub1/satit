module Satit::TeacherAPI

  class TeacherActionEntity < Grape::Entity
    expose :id
    expose :first_name
    expose :last_name
    expose :status
  end
end