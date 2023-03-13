class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = Reservation.new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @reservation.vehicle = @vehicle
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      redirect_to reservations_path, notice: 'Reservation created successfully'
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :vehicle_id)
  end
end
