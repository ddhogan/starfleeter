class ChangeColumnAssignments < ActiveRecord::Migration[5.1]
  def change
    change_column :assignments, :crew_id, using: 'crew_id::integer'
    change_column :assignments, :ship_id, using: 'ship_id::integer'
  end
end
