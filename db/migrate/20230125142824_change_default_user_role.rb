class ChangeDefaultUserRole < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :role, from: "user", to: "regular"
  end
end
