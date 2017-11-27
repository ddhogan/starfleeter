class CreateShips < ActiveRecord::Migration[5.1]
  def change
    create_table :ships do |t|
      t.string :name
      t.string :type_class
      t.integer :warp_factor
      t.integer :complement
      t.string :note
    end
  end
end
