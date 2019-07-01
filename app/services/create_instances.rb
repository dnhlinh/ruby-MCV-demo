require 'rest-client'

module Services
  class CreateInstance
    attr_reader :project_id, :instance_data, :organiaztion_id
    # $output = []

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
      # RETURN CLIENT
      @client_response = RestClient.get 'http://localhost:9090/clients' # why doesn't this return anything?
      @clients_hash = JSON.parse(@client_response.body)
      @client_list = @clients_hash['clients']
      @client = @client_list.find { |x| x['project_id'] == @project_id.to_i }
      #RETURN PROJECT
      @project_response = RestClient.get 'http://localhost:9090/projects/' + @project_id
      @project = JSON.parse(@project_response)
      #RETURN ORGANIZATION
      @organization_id = @project['organization_id']
      @organization_response = RestClient.get 'http://localhost:9090/organizations/' + @organization_id.to_s
      @organization = JSON.parse(@organization_response)

      output = {
              client_id:  @client['id'],
              client_lastname: @client['lastname'],
              project_id: @project['id'],
              project_name: @project['name'],
              organization_id: @organization['id'],
              organization_name: @organization['name']
              }

        output
    end
  end
end
