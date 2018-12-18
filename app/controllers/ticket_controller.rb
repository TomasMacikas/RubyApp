# # frozen_string_literal: true
#
# # articles controller class
class TicketController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def create
    Ticket.create(ticket: params.fetch(:ticket).fetch(:ticket)) if params.key?(:ticket)
  end

  def destroy
    @ticket = Ticket.find_by(nil)
    @ticket.destroy
  end

  def about
  end
end
