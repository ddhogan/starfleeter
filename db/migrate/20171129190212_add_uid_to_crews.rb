class AddUidToCrews < ActiveRecord::Migration[5.1]
  def change
    add_column :crews, :uid, :string
    add_column :crews, :email, :string
    add_column :crews, :image, :string
  end
end
