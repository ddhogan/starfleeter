class AddPasswordDigestToCrews < ActiveRecord::Migration[5.1]
  def change
    add_column :crews, :password_digest, :string
  end
end
