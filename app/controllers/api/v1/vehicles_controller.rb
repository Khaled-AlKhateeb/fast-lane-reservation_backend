class Api::V1::VehiclesController < ApplicationController
  # GET /vehicles
  def index
    @vehicles = Vehicle.all.order(created_at: :DESC)

    render json: @vehicles, status: 200
  end

  # GET /vehicles/1
  def show
    @vehicle = Vehicle.find(params[:id])
    render json: @vehicle, status: 200
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

  # Only allow a list of trusted parameters through.
  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :model, :price, :description, :image, :horse_power)
  end
end
