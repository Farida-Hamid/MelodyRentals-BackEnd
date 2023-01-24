class AddReservationDateColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :pickup_date, :date
    add_column :reservations, :return_date, :date
  end
end
