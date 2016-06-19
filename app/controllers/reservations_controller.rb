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
    rezzie = 0   
    tables.each do |table|
      if Reservation.where(table_id: table.id).where(date: params[:date]).where(timeslot: params[:timeslot]).length == 0
        @reservation = Reservation.new(
        name: params[:name],
        date: params[:date],
        timeslot: params[:timeslot].to_i,
        table_id: table.id
        )
        @reservation.save
        rezzie += 1
        break if @reservation.save
      
      end
    end 
    
    if rezzie == 1
        redirect_to "/reservations/#{@reservation.id}"
    else 
      flash[:warning] = "There are no tables with your desired seats available at that timeslot. Please try a different day or time."
      redirect_to "/reservations/new"

    end
    
  end

  # def destroy
  #  @reservation.destroy    
  # end

end
