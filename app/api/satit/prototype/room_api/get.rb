module Satit::Prototype::RoomAPI

  class Get < Grape::API

    resource :room do
      before do
        return error!('token expired', 500) unless check_token?
      end

      
      helpers do
        
        def room_list 
          Room.present.order
        end

        def current_room
          @room ||= Room.find(params[:room_id])
        end 

      end

      desc 'return room list present'
      get '/present' do 
        present :room_list, room_list.order(:created_at) \
        , with: Satit::RoomAPI::RoomListEntity
      end

      desc 'return year_room all'
      get :year_room_all do
        present :year_rooms, Room::RoomList.new.year_room_all\
        , with: Satit::RoomAPI::YearRoomListEntity
      end

      desc 'room list by year_room id'
      params do
        requires :id, type: Integer, desc: 'id of year_room'
      end
      get :room_ids do
        present :rooms, Room::RoomList.new(year_room_id: params[:id]).rooms_by_year_room_ids\
        , with: Satit::RoomAPI::RoomListEntity
      end

      desc 'room list by year_room id'
      params do
        requires :id, type: Integer, desc: 'id of year_room'
      end
      get '/' do
        present :rooms, Room::RoomList.new.by_ids(params[:id])\
        , with: Satit::RoomAPI::RoomListEntity
      end
    end

  end

end