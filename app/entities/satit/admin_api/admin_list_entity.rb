module Satit::AdminAPI

  class AdminListEntity < Grape::Entity
    expose :first_name
    expose :last_name
  end
end