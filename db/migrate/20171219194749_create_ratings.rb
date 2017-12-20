class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.string :note
      t.integer :crew_id
    end
  end
end
