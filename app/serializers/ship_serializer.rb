class ShipSerializer < ActiveModel::Serializer
  attributes :id, :name, :type_class, :warp_factor, :complement, :note
  has_many :assignments
  has_many :crews, through: :assignments
end
