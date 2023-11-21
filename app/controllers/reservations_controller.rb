class ReservationsController < ApplicationController
    def index
        @reservations = Reservation.all
    end

    def new
        @reservation = Reservation.new
    end

    def confirm 
        @reservation = Reservation.new(reservation_params) 
        @room = Room.find(@reservation.room_id)
        if @reservation.invalid?
            render "rooms/show"
        end
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
             redirect_to reservations_path
        end
    end

    def show
        @reservation = Reservation.find(params[:id])
    end

    def edit
        @reservation = Reservation.find(params[:id])
    end

    def update
        @reservation = Reservation.find(params[:id])
        if @reservation.update(reservation_params)
            redirect_to reservations_path
        else
            render "edit"
        end
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        redirect_to reservations_path
    end


    private

    def reservation_params
        params.require(:reservation).permit(:check_in, :check_out, :person, :sum_price, :user_id, :room_id)
    end

end
