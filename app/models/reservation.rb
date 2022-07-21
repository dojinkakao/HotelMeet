class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :rooms, foreign_key: true

    validates :user_id, numericality: true
    validates :room_id, numericality: true
    validates :number_of_people, numericality: true
end
