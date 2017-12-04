class ChangeDataTypeForWarpFactor < ActiveRecord::Migration[5.1]
  def change
    change_column(:ships, :warp_factor, :float)
  end
end
