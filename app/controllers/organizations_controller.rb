class OrganizationsController < ApplicationController
  def index
    render json: Organization.list
  end

  def show
    render json: Organization.get_by_id(params[:id])
  end

  def create
    render json: Organization.save({organization: "Organization D", id: 4})
  end

  def destroy
    render json: Organization.delete(params[:id])
  end

  def update
    render json: Organization.save({organization: "Organization update", id: params[:id]})
  end
end
