class Api::V1:class InstrumentsController < ApplicationController
      before_action :set_instrument, only: [:show]
      before_action :authenticate_user!, except: %i[index show]

      # GET /instruments
      def index
        @instruments = Instrument.all

        render json: @instruments, status: :ok
      end

      # GET /instruments/1
      def show
        render json: @instrument, status: :ok
      end

      # POST /instruments
      def create
        unless current_user.role == 'admin'
          return render json: { error: 'You do not have authorization' },
                        status: :unauthorized
        end
        @instrument = Instrument.new(instrument_params)

        if @instrument.save
          render json: @instrument, status: :created, location: @instrument
        else
          render json: @instrument.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /instruments/1
      def update
        unless current_user.role == 'admin'
          return render json: { error: 'You do not have authorization' },
                        status: :unauthorized
        end
        if @instrument.update(instrument_params)
          render json: @instrument
        else
          render json: @instrument.errors, status: :unprocessable_entity
        end
      end

      # DELETE /instruments/1
      def destroy
        unless current_user.role == 'admin'
          return render json: { error: 'You do not have authorization' },
                        status: :unauthorized
        end
        @instrument.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_instrument
        @instrument = Instrument.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'Instrument not found' }, status: :not_found
      end

      # Only allow a trusted parameter "white list" through.
      def instrument_params
        params.require(:instrument).permit(
          :name, :description, :image, :price, :quantity, :category
        )
      end
end
