module ApiController

  class RoomsController < ApplicationController

    # before_filter: cors_set_access_control_headers
    skip_before_filter :verify_authenticity_token

    def choice_room
      room_id(params[:room_id])
    end 

    def room
      choice_room
      puts current_room.level
      respond_to do |format|
        @current_room = { status: '200' }
        format.json { render json:  @current_room }
      end
    end

    protected
   
    def json_request?
        request.format.json?
    end

  end

end