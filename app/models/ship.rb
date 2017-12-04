class Ship < ApplicationRecord
    has_many :assignments, dependent: :destroy
    has_many :crews, through: :assignments

    validates_presence_of :name

    # return the current fastest ship
    def self.fastest
        order(:warp_factor).last
    end

    def assignments_attributes=(assignments_attributes)
        assignments_attributes.values.each do |assignment_attributes|
            if assignments_attributes[:crew_id] != ""
                assignment = Assignment.find_or_create_by(assignment_attributes)
                if !self.assignments.include?(assignment)
                    self.assignments.build(assignment_attributes)
                end
            end
        end
    end
end
