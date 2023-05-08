class Room < ApplicationRecord
    belongs_to :user, optional: true
    has_many :reservations
    attachment :image
end
