class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :crew_id, :ship_id
  belongs_to :ship
  belongs_to :crew
end
