module Satit::Prototype
 
  class API < Grape::API

      

    mount TeacherAPI::Post
    mount TeacherAPI::Get
    mount RoomAPI::Get
    mount RoomAPI::Post
    mount AdminAPI::Post
  end

end