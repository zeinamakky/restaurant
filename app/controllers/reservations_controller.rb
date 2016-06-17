class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @tables = Table.all
  end

  def show
    @reservation = Reservation.find_by(id: params[:id])
    @hours = [1..24]
  end

  def create
    tables = Table.where(seats: params[:seats])   
    if Reservation.where(table_id: tables[0].id).where(date: params[:date]).where(timeslot: params[:timeslot]).length == 0
      @reservation = Reservation.new(
      name: params[:name],
      date: params[:date],
      timeslot: params[:timeslot].to_i,
      table_id: tables[0].id
      )

      @reservation.save
      redirect_to "/reservations/#{@reservation.id}"

    elsif Reservation.where(table_id: tables[1].id).where(date: params[:date]).where(timeslot: params[:timeslot]).length == 0
      @reservation = Reservation.new(
      name: params[:name],
      date: params[:date],
      timeslot: params[:timeslot].to_i,
      table_id: tables[1].id
      )
      @reservation.save
      redirect_to "/reservations/#{@reservation.id}"
    else 
      flash[:warning] = "that table is taken at that time"
      redirect_to "/reservations/new"
    end
  
    
  end

  # def destroy
  #  @reservation.destroy    
  # end

end
