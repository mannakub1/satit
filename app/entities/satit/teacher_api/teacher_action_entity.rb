module Satit::TeacherAPI

  class TeacherActionEntity < Grape::Entity
    expose :id
    expose :prefix
    expose :first_name
    expose :last_name
    expose :username
    expose :status
  end
end