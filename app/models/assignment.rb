class Assignment < ApplicationRecord
    has_many :ships
    belongs_to :crew
end
