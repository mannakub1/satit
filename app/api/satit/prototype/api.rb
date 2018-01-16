module Satit::Prototype

 
  class API < Grape::API
    before do
      origin
    end
    
    
    mount TeacherAPI::Post
    mount TeacherAPI::Get
    mount TeacherAPI::API
    mount RoomAPI::Get
    mount RoomAPI::Post
    mount AdminAPI::Post
    mount SubjectAPI::Post
    mount SubjectAPI::Get
  end

end