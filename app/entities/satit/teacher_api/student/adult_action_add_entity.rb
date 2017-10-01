module Satit::TeacherAPI::Student

  class AdultActionAddEntity < Grape::Entity
    expose :id
    expose :prefix
    expose :first_name
    expose :last_name
    expose :image
    expose :address
    expose :call
    expose :zip_code
    expose :enthicity
    expose :nationality
    expose :district
    expose :parish
    expose :city
    expose :iden_number
  end
end