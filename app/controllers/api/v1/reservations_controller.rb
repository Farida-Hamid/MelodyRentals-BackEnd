module Api
  module V1
    class ReservationsController < ApplicationController
      # before_action :authorize_request
      # before_action :authenticate_user!
      def index
        render json: @current_user.reservations.includes([:instrument]).order(id: :desc), status: :ok
      end

      def create
        reservation = Reservation.new(reservation_params)
        reservation.user_id = @current_user.id
        if reservation.save!
          render json:
          {
            status: 201,
            message: 'Instrument resedrved Successfully'
            # data: ReservationSerializer.new(reservation)
          }, status: :created
        else
          render json: { error: 'Error creating reservation' }, status: :unprocessable_entity
        end
      end

      def destroy
        reservation = Reservation.find(params[:id])
        if reservation.destroy
          render json: { status: 200, message: 'Reservation cancelled successfully' }, status: :ok
        else
          render json: { error: 'Error cancelling reservation' }, status: :unprocessable_entity
        end
      end

      private

      def reservation_params
        params.permit(:instrument_id, :pickup_date, :return_date, :user_id)
      end
    end
  end
end
