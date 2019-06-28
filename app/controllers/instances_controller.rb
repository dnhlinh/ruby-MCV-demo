class InstancesController < ApplicationController
  def index
    render json: Instance.list
  end

  def show
    render json: Instance.get_by_id(params[:id])
  end

  # POST url/projects/project_id/instances
  def create
    data = {
      project_id: params[:project_id],
      instance_data: JSON.parse(request.body.read)
    }

    begin
      result = Services::CreateInstance.new.call(data)
      render json: result
    rescue Exception => ex
      render json: { error: ex.message }, status: 422
    end
  end

  def destroy
    render json: Instance.delete(params[:id])
  end

  def update
    render json: Instance.save({firstname: "Hono", lastname: "Lulu", id: params[:id]})
  end
end
