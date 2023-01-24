module Api
  module V1
    class InstrumentsController < ApplicationController
        before_action :set_instrument, only: [:show, :update, :destroy]

        # GET /instruments
        def index
            @instruments = Instrument.all
    
            render json: @instruments
        end

        # GET /instruments/1
        def show
            render json: @instrument
        end

        # POST /instruments
        def create
            @instrument = Instrument.new(instrument_params)
    
            if @instrument.save
                render json: @instrument, status: :created, location: @instrument
            else
                render json: @instrument.errors, status: :unprocessable_entity
            end
        end

        # PATCH/PUT /instruments/1
        def update
            if @instrument.update(instrument_params)
                render json: @instrument
            else
                render json: @instrument.errors, status: :unprocessable_entity
            end
        end

        # DELETE /instruments/1
        def destroy
            @instrument.destroy
        end

        private

        # Use callbacks to share common setup or constraints between actions.
        def set_instrument
            @instrument = Instrument.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def instrument_params
            params.require(:instrument).permit(:name, :description, :image, :price, :quantity, :category)
        end
    end
  end
end
