class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.to_json(include: :vehicle)
    render json: @reservations, status: 200
    # @kenny
  end

  def create
    # @vehicle = Vehicle.find(params[:id])
    # @user = User.find(params[:id])
      @reservation = current_user.reservations.new(reservation_params)
    # @reservation = Reservation.new(reservation_params)
    # @reservation.user_id = @user.id
    # @reservation.vehicle_id = @vehicle.id

    if @reservation.save!
      puts current_user.email, "C user"
      puts current_user.id, "C user id"
      render json: {
        message: 'Reservation has been made'
      }, status: 200
    else
      render json: {
        message: 'An Error Occured'
      }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.permit(:from_date, :to_date, :number_of_person, :vehicle_id)
  end
end
