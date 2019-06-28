module Services
  class CreateInstance
    attr_reader :project_id, :instance_data

    def call(data)
      @project_id = data[:project_id]
      @instance_data = data[:instance_data]

      validate
      call_nodejs_api
    end

    private

    def validate
      raise 'project_id is required' unless @project_id
      raise 'instance data is required' unless @instance_data
      raise 'instance name is required' unless @instance_data['name'] # <- json use ''
    end

    def call_nodejs_api
      :ok
    end
  end
end
