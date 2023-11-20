class RoomsController < ApplicationController
    def top
        @rooms = Room.all
    end

    def index
        @rooms = Room.all
    end

    def new
        @room = Room.new
        @user = User.find(current_user.id)
    end

    def create
        @room = Room.new(room_params)
        if @room.save
            redirect_to :rooms
        else
            render "new"
        end
    end

    def show
        @room = Room.find(params[:id])
        @reservation = Reservation.new
    end

    def edit
        @room = Room.find(params[:id])
    end

    def update
    end

    def destroy
    end

    private

    def room_params
        params.require(:room).permit(:name, :description, :price, :address, :user_id, :image)
    end
end
