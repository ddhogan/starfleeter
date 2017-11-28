class Ship < ApplicationRecord
    has_many :assignments
    has_many :crews, through: :assignments

    validates :name, presence: true

    validates :warp_factor, numericality: { allow_nil: true }

    
    # return the current fastest ship
    def self.fastest
        order(:warp_factor).last
    end

    def assignments_attributes=(assignments_attributes)
        assignments_attributes.values.each do |a|
            self.assignments.build(a)
        end
    end
end
