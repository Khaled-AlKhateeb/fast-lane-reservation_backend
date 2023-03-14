class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.includes(:vehicle)
    render json: @reservations, status: 200
    @kenny
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      render json: {
        message: 'Reservation has been made'
      }, status: 201
    else
      render json: {
        message: 'An Error Occured'
      }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :vehicle_id)
  end
end
