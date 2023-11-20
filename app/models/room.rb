class Room < ApplicationRecord
    validates :user_id, presence: true
    validates :price, presence: true, numericality: {greater_than_or_equal_to: 1}
    validates :name, presence: true
    validates :description, presence: true,  length:{maximum: 200}
    validates :address, presence: true


    belongs_to :user
    has_one :reservation
    has_one_attached :image

    def rooms
        return Room.where(user_id: self.id)
    end
end
