class Ship < ApplicationRecord
    has_many :assignments
    has_many :missions, through: :assignments
end
