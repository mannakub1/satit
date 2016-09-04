module Satit::Prototype
 
  class API < Grape::API

      

    mount TeacherAPI::Post
    mount TeacherAPI::Get
    mount TeacherAPI::API
    mount RoomAPI::Get
    mount RoomAPI::Post
    mount AdminAPI::Post
  end

end