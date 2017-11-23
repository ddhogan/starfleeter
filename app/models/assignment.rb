class Assignment < ApplicationRecord
    belongs_to :mission
    belongs_to :ship
    has_many :crew
end
