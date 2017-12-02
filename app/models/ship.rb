class Ship < ApplicationRecord
    has_many :assignments, dependent: :destroy
    has_many :crews, through: :assignments

    validates :name, presence: true

    validates :warp_factor, numericality: { allow_nil: true }


    # return the current fastest ship
    def self.fastest
        order(:warp_factor).last
    end

    def assignments_attributes=(assignments_attributes)
        assignments_attributes.values.each do |assignment_attributes|
            assignment = Assignment.find_or_create_by(assignment_attributes)
            if !self.assignments.include?(assignment)
                self.assignments.build(assignment_attributes)
            end
        end
    end
end
