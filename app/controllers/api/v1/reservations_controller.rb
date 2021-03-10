class Api::V1::ReservationsController < ApplicationController
  def index
    reservations = Reservation.all
    render json: { status: 200, message: "Loaded reservations", data: reservations }
  end

  def create
    params = reservation_params
    params[:user_id] = current_api_v1_user.id
    reservation = Reservation.new(params)
    if reservation.save
      render json: { status: 200, data: reservation }
    else
      render json: { status: 400, data: reservation.errors }
    end
  end

  def destroy
    if reservation = Reservation.find_by(id: params[:id])
      reservation.destroy
      render json: { status: 200, message: "Deleted the reservation", data: reservation }
    else
      render json: { status: 400, data: reservation.errors }
    end
  end

  def update
    if reservation = Reservation.find_by(id: params[:id])
      if reservation.update(reservation_params)
        render json: { status: 200, message: "update the reservation", data: reservation }
      end
    else
      render json: { status: 400, data: reservation.errors }
    end
  end

  def reservation_params
    params.require(:reservation).permit(:id, :name, :all_day, :start_datetime, :end_datetime, :user_id, :created_at, :updated_at)
  end
end
