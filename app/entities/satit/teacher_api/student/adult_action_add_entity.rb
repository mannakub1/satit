module Satit::TeacherAPI::Student

  class AdultActionAddEntity < Grape::Entity
    expose :id
    expose :prefix
    expose :first_name
    expose :last_name
    expose :address
    expose :call
    expose :zip_code
    expose :enthicity
    expose :district
    expose :parish
    expose :city
  end
end