class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[update destroy]
  before_action :authenticate_user!

  def index
    render json: current_user.reservations.includes([:instrument]).order(id: :desc), status: :ok
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save!
      render json:
      {
        status: 201,
        message: 'Instrument reserved successfully'
      }, status: :created
    else
      render json: { error: 'Error creating reservation' }, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      render json: { status: 200, message: 'Reservation cancelled successfully' }, status: :ok
    else
      render json: { error: 'Error cancelling reservation' }, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Reservation not found' }, status: :not_found
  end

  def reservation_params
    params.require(:reservation).permit(:instrument_id, :pickup_date, :return_date, :user_id)
  end
end
