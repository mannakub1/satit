module Satit::Prototype::TeacherAPI

  class API < Grape::API

    mount StudentAPI::Post
    mount StudentAPI::Get
  end
end