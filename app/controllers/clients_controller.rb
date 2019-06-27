class ClientsController < ApplicationController
  def index
    render json: Client.list
  end

  def show
    render json: Client.get_by_id(params[:id])
  end

  def create
    render json: Client.save({firstname: "Lady", lastname: "Gaga", id: 4})
  end

  def destroy
    render json: Client.delete(params[:id])
  end

  def update
    render json: Client.save({firstname: "Hono", lastname: "Lulu", id: params[:id]})
  end
end
