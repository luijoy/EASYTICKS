class TicketsController < ApplicationController

  def index
    @tickets= Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(host_params)
    @ticket.save
    redirect_to tickets_path(@ticket.id)
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(host_params)
  end

  def destroy
    @ticket = Ticket.find[params(:id)]
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_id, :date, :time, :departing_city, :arrival_city, :price, :booking_reference)
  end

end

