module Satit::Prototype::RoomAPI

  class Get < Grape::API

    resource :room do
      before do
        return error!('token expired', 500) unless check_token?
      end

      
      helpers do
        
        def room_list 
          Room.present
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

      
    end

  end

end