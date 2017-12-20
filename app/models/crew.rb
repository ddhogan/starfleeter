class Crew < ApplicationRecord

    has_secure_password
    
    has_many :assignments, dependent: :destroy
    has_many :ships, through: :assignments
    has_many :ratings

    validates_presence_of :name
    validates :name, uniqueness: { scope: :rank, message: "A crew person with this name and rank already exists"}

    def formal_title
        if self.rank
            "#{self.rank} #{self.name}"
        else
            "#{self.name}"
        end
    end
    
end
