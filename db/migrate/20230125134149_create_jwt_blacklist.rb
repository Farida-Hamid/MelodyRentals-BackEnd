class CreateJwtBlacklist < ActiveRecord::Migration[7.0]
  def change
    create_table :jwt_blacklist do |t|
      t.string :jti
      t.datetime :exp

      t.timestamps
    end
    add_index :jwt_blacklist, :jti
  end
end
