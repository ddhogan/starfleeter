class CreateMissions < ActiveRecord::Migration[5.1]
  def change
    create_table :missions do |t|
      t.string :name
      t.integer :assignment_id
      t.timestamps
    end
  end
end
