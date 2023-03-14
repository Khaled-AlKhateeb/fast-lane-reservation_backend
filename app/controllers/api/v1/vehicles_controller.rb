class Api::V1::VehiclesController < ApplicationController
  # GET /vehicles
  def index
    @vehicles = Vehicle.all.order(:created_at)

    render json: @vehicles, status: :ok
  end

  # GET /vehicles/1
  def show
    @vehicle = Vehicle.find(params[:id])
    render json: @vehicle, status: :ok
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      render json: @vehicle, status: :created, location: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vehicle_params
    params.permit(:vehicle).permit(:name, :model, :price, :description, :image, :horse_power)
  end
end
