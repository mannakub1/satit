module Satit::Prototype::RoomAPI

  class Post < Grape::API
    
    resource :room do 
      before do
        origin
        return error!('token expired', 500) unless check_token?
      end

    
      desc 'add room'
      params do
        requires :level, type: String, desc: 'level of room'
        requires :name, type: String, desc: 'name of room'
        requires :year_room_id, type: Integer, desc: 'created year'
        optional :priority, type: Integer, desc: 'priority for sort a rooms'
      end
      post '/add' do
        present Room::RoomAction.new(year_room_id: params[:year_room_id]).add(\
                                      level: params[:level], name: params[:name],\
                                      year_room_id: params[:year_room_id], priority: params[:priority])\
        , with: Satit::RoomAPI::RoomListEntity
      end

      desc 'edit room' 
      params do
        requires :room_id, type: Integer, desc: 'id of room for finding this room id'
        requires :level, type: String, desc: 'level of room'
        requires :name, type: String, desc: 'name of room'
        requires :year_room_id, type: Integer, desc: 'created year'
        optional :priority, type: Integer, desc: 'priority for sort a rooms'
      end
      post '/edit' do
        present Room::RoomAction.new(year_room_id: params[:year_room_id], room_id: params[:room_id]).edit(\
                                    level: params[:level], name: params[:name],priority: params[:priority]) \
        , with: Satit::RoomAPI::RoomListEntity
      end

      desc 'edit room' 
      params do
        requires :room_id, type: Integer, desc: 'id of room for finding this room id'
        requires :year_room_id, type: Integer, desc: 'created year'
      end
      post '/delete' do
        present Room::RoomAction.new(year_room_id: params[year_room_id], room_id: params[:room_id]).destroy\
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