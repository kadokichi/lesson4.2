class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room
    has_one_attached :image

    validates :check_in, presence: true
    validates :check_out, presence: true
    validates :person, presence: true, numericality: {greater_than_or_equal_to: 1}
    validate :date_compare
    validate :date_check_in

    def date_compare
        if check_out.to_s < check_in.to_s
            errors.add(:注意※, "チェックアウトの日付はチェックイン以降の日付を選択してください")
        end
    end

    def date_check_in
        if check_in.to_s < Date.today.to_s
            errors.add(:注意※, "チェックインの日付は本日以降の日付を選択してください")
        end
    end
end
