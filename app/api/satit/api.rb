module Satit
  class API < Grape::API
    format :json
    prefix :api

    before do
      origin
    end
    rescue_from :all do |e|
      error!(e.message, 422)
    end

    helpers do 

      def check_token?  
        Admin::AdminAction.new.check_token(headers['Token'])
      end

      def origin
        
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      end

      def token
       puts  headers['Token']
        headers['Token']
      end

    end

    desc 'Creates and returns access_token if valid login'
    params do
      requires :username, type: String, desc: ''
      requires :password, type: String, desc: ''
    end
    post :login do
      present Admin::AdminAction.new(params: params).authenication
    end

    desc 'User logout access_token expired'
    post :logout do
      present Admin::AdminAction.new.logout(token)\
      , with: Satit::AdminAPI::AdminActionLogoutEntity
    end

    mount Prototype::API

  end
end