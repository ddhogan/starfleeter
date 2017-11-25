class Crew < ApplicationRecord
    has_secure_password
    belongs_to :assignment
end
