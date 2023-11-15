class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    def nunber_of_days
        (@reservation.check_out - @reservation.check_in).to_i
    end
end
