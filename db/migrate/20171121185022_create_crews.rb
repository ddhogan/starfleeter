class CreateCrews < ActiveRecord::Migration[5.1]
  def change
    create_table :crews do |t|

      t.timestamps
    end
  end
end
