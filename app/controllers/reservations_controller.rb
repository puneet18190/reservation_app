class ReservationsController < ApplicationController
  before_action :set_restaurant

  def index
    @reservations = @restaurant.reservations.map{|obj| [obj.table.name, obj.reservation_at, obj.guest.name, obj.guest_count]}
    render json: { reservations: @reservations }, status: 200
  end

  def update
    params[:table_id] = @restaurant.tables.find_by(name: params[:table]).try(:id)
    params[:shift_id] = @restaurant.shifts.find_by(name: params[:shift]).try(:id)
    params[:guest_id] = Guest.find_by(name: params[:guest]).try(:id)
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      render json: { data: @reservation }, status: 200
    else
      render json: { errors: @reservation.errors.full_messages }, status: 422
    end
  end

  def create
    params[:table_id] = @restaurant.tables.find_by(name: params[:table]).try(:id)
    params[:shift_id] = @restaurant.shifts.find_by(name: params[:shift]).try(:id)
    params[:guest_id] = Guest.find_by(name: params[:guest]).try(:id)
    @reservation = @restaurant.reservations.new(reservation_params)
    if @reservation.save
      render json: { data: @reservation }, status: 200
    else
      render json: { errors: @reservation.errors.full_messages }, status: 422
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.where(name: params[:restaurant_name]).first
    render json: { data: "Invalid Restaurant" } unless @restaurant
  end

  def reservation_params
    params.permit(:table_id, :shift_id, :guest_id, :guest_count, :reservation_at)
  end
end
