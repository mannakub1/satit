module Satit::Prototype::RoomAPI

  class Post < Grape::API
    
    resource :room do 
      before do
        return error!('token expired', 500) unless check_token?
      end

    
      desc 'add room'
      params do
        # requires :csv, type: File, desc: 'list student file csv'
        requires :level, type: String, desc: 'level of room'
        requires :name, type: String, desc: 'name of room'
        requires :year, type: String, desc: 'created year'
      end
      post '/add' do
        present Room::RoomAction.new(level: params[:level], name: params[:name], year: params[:year]).add \
        , with: Satit::RoomAPI::RoomListEntity
      end
      
    end

  end

end