class CreateCrews < ActiveRecord::Migration[5.1]
  def change
    create_table :crews do |t|
      t.string :name
      t.string :rank
      t.string :specialty
      t.boolean :clearance, default: false
      t.integer :assignment_id
      t.string :password_digest
    end
  end
end
