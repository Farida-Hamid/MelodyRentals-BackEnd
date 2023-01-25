class Api::V1::InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show]
  before_action :authenticate_user!, except: %i[index show]

  # GET /instruments
  def index
    @q = Instrument.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @instruments = @q.result.includes(:user)
    respond_to do |format|
      format.json do
        render json: InstrumentSerializer.new(@instruments).serializable_hash[:data].map { |instrument|
                       instrument[:attributes]
                     }
      end
    end
  end

  # GET /instruments/1
  def show
    render json: { instrument: InstrumentSerializer.new(@instrument).serializable_hash[:data][:attributes] }, status: :ok
  end

  # POST /instruments
  def create
    authorize @instrument = Instrument.new(instrument_params)
    begin
      @instrument.save!
      render json: @instrument, status: :created
    rescue StandardError => e
      render json: { errors: e }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /instruments/1
  def update
    authorize @instrument = Instrument.find(params[:id])
    begin
      @instrument.update!(instrument_params)
      render json: @instrument, status: :ok
    rescue StandardError => e
      render json: { errors: e }, status: :unprocessable_entity
    end
  end

  # DELETE /instruments/1
  def destroy
    authorize @instrument = Instrument.find(params[:id])
    begin
      @instrument.destroy!
      render json: { message: 'Instrument deleted successfully' }, status: :ok
    rescue StandardError => e
      render json: { errors: e }, status: :unprocessable_entity
    end
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
      :name, :description, :image, :price, :quantity, :category, :user_id
    )
  end
end
