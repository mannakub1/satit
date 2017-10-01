module Satit::TeacherAPI::Student

  class StudentListEntity < Grape::Entity
    expose :id
    expose :prefix
    expose :thumb
    expose :image
    expose :code_number
    expose :first_name
    expose :last_name
    expose :iden_number
    expose :blood
    expose :birthdate
    expose :address
    expose :call
    expose :zip_code
    expose :ability
    expose :ethnicity
    expose :nationality
    expose :district
    expose :parish
    expose :city
    expose :delete_status
    expose :father\
    , with: Satit::TeacherAPI::Student::AdultActionAddEntity
    expose :mother\
    , with: Satit::TeacherAPI::Student::AdultActionAddEntity
    expose :guardian\
    , with: Satit::TeacherAPI::Student::AdultActionAddEntity
  end

end