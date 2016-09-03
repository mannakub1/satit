module Satit::Prototype::AdminAPI

  class Post < Grape::API

    resource :login do
      before do
        return error!('token expired', 500) unless check_token?
      end


      desc 'admin login' 
      params do
        requires :username, type: String, desc: ''
        requires :password, type: String, desc: ''
      end
      post '/admin' do
        present Admin::AdminAction.new(params: params).authenication\
        , with: Satit::AdminAPI::AdminActionEntity
      end

    end
  end

end