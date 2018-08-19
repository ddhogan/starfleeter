class ChangeColumnDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :crews, :rank, "Civilian"
  end
end
