module Satit::Prototype::TeacherAPI

  class API < Grape::API

    mount StudentAPI::Post
    
  end
end