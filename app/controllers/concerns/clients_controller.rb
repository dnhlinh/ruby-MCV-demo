class ClientsController < ApplicationController
    def index
        render json: Client.list
    end

    def show
        render json: Client.get_by_id(params[:id])
    end

    def create
        render json: Client.save({A: 9}, B: {C: 000})
    end

    def destroy
        render json: Client.delete(params[id])
    end

    def update
        render json: Client.save({A:params[:id]})
    end
end
