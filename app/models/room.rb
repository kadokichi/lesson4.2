class Room < ApplicationRecord
    validates :user_id, {presence: true}
    belongs_to :user
    has_one :reservation
    has_one_attached :image

    def rooms
        return Room.where(user_id: self.id)
    end
end
