class ReservationsController < ApplicationController
    def index
        
    end

    def new
        @reservation = Reservation.new
    end

    def confirm 
        @reservation = Reservation.new(reservation_params)
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
             redirect_to :reservations
        end
    end

    def show
        @reservation = Reservation.find(params[:id])
    end

    def edit
        @reservation = Reservation.find(params[:id])
    end

    def update
    end

    def destroy
    end


    private

    def reservation_params
        params.permit(:check_in, :check_out, :person, :sum_price, :user_id, :room_id)
    end

end
