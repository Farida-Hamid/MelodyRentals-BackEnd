class AddUserToInstrument < ActiveRecord::Migration[7.0]
  def change
    add_reference :instruments, :user, null: false, foreign_key: true
  end
end
