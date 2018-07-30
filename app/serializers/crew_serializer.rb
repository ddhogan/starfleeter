class CrewSerializer < ActiveModel::Serializer
  attributes :id, :name, :rank, :specialty, :clearance
  has_many :assignments
  has_many :ships, through: :assignments
end
