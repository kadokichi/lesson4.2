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
        @room = Room.find(params[:id])
        if @room.update(room_params)
            redirect_to :rooms
        else
            render "edit"
        end
    end

    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        redirect_to :rooms
    end

    def search
        if params[:address].present?
            @rooms = Room.where("address like ? ","%#{params[:address]}%")
        elsif  params[:word].present?
            @rooms = Room.where("name like ? OR description like ? ","%#{params[:word]}%","%#{params[:word]}%")
        elsif  params[:address].present? && params[:word].present? 
            @rooms = Room.where("address like ? ","%#{params[:address]}%").where("name like ? OR description like ? ","%#{params[:word]}%","%#{params[:word]}%")
        else
            @rooms = Room.all
        end
    end

    private

    def room_params
        params.require(:room).permit(:name, :description, :price, :address, :user_id, :image)
    end
end
