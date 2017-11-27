class Ship < ApplicationRecord
    has_many :assignments
    has_many :crews, through: :assignments
end
