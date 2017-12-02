class Ship < ApplicationRecord
    has_many :assignments, dependent: :destroy
    has_many :crews, through: :assignments

    validates :name, presence: true

    validates :warp_factor, numericality: { allow_nil: true }


    # return the current fastest ship
    def self.fastest
        order(:warp_factor).last
    end

    def assignments_attributes=(assignment_hashes)
        assignment_hashes.values.each do |assignments_attributes|
            assignment = Assignment.find_or_create_by(assignments_attributes)
            if !self.assignments.include?(assignment)
                self.assignments.build(:assignment => assignment)
            end
        end
    end
end
