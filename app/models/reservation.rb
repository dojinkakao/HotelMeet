class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :user_id, presence: true, numericality: true
    validates :room_id, presence: true, numericality: true
    validates :number_of_people, numericality: true
    validates :start, presence: true
    validates :end, presence: true
end
