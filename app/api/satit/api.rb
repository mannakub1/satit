module Satit
  class API < Grape::API
    format :json
    prefix :api

    rescue_from :all do |e|
      error!(e.message, 422)
    end
    mount Prototype::API
  end
end