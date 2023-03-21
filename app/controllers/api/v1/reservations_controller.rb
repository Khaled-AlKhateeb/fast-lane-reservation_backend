class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.includes(:vehicle)
    render json: @reservations, status: 200
    # @kenny
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = 1
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
    params.permit(:from_date, :to_date, :number_of_person)
  end
end
