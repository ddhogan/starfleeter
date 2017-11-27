class Crew < ApplicationRecord

    has_secure_password
    
    has_many :assignments
    has_many :ships, through: :assignments

    validates_presence_of :name
end
