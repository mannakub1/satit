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
        requires :year_room_id, type: Integer, desc: 'created year'
      end
      post '/add' do
        present Room::RoomAction.new(level: params[:level], name: params[:name], year: params[:year]).add \
        , with: Satit::RoomAPI::RoomListEntity
      end
      
      desc 'create year_room and all rooms'
      params do
        requires :name, type: String, desc: 'name of year'
      end
      post '/create_year_room' do 
        present Admin::YearRoomAction.new.add(params)\
        , with: Satit::RoomAPI::RoomListEntity
      end
    end

  end

end