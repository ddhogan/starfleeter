class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :description
      t.string :crew_id
      t.integer :ship_id
      t.timestamps
    end
  end
end
