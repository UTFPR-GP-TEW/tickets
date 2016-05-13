class Api::V1::TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :update, :destroy]

  def index
    tickets = Ticket.all
    if status = params[:status]
      tickets = tickets.where(status: status)
    end
    render json: tickets, status: 200
  end

  def show
    render json: @ticket, status: 200
  end

  def create
    ticket = Ticket.new(ticket_params)
    if ticket.save
      render json: ticket, status: :created, location: ticket
    else
      render json: ticket.errors, status: :unprocessable_entity
    end
  end

  def update
    if @ticket.update(ticket_params)
      render json: @ticket, status: 200
    else
      render json: @ticket.errors, status: 422
    end
  end

  def destroy
    @ticket.destroy
    head 204
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :project_id, :status)
  end
end