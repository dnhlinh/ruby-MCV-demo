class ProjectsController < ApplicationController
  def index
    render json: Project.list
  end

  def show
    render json: Project.get_by_id(params[:id])
  end

  def create
    render json: Project.save({project_name: "Project D", organization_id: 3, id: 4})
  end

  def destroy
    render json: Client.delete(params[:id])
  end

  def update
    render json: Client.save({project_name: "Project update", organization_id: 2, id: params[:id]})
  end
end
