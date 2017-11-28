class Ship < ApplicationRecord
    has_many :assignments
    has_many :crews, through: :assignments

    validates :name, presence: true

    validates :warp_factor, numericality: { allow_nil: true }


    # return the current fastest ship
    def self.fastest
        order(:warp_factor).last
    end

    def crews_attributes=(crews_attributes)
        crews_attributes.values.each do |c|
            if c[:name].present?
                crew = Crew.find_or_create_by(c)
                if !self.crews.include?(crew)
                    self.assignment.build(:crew => crew)
                end
            end
        end
    end
end
