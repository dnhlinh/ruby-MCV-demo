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
      client = get_client
      project = get_project
      project_list = get_project_list
      organization_id = project_list['organization_id']
      organization = get_organization(organization_id.to_s)

      {
        client: client,
        project: project,
        organization: organization
      }
    end

    def get_project_list
      project_response = node_call('projects/' + @project_id)
      return nil unless project_response

      project = JSON.parse(project_response)
      return nil unless project
      
      project

    end

    def get_project
      project_list = get_project_list
      {
        project_id: project_list['id'],
        project_name: project_list['name']
      }
    end

    def get_organization(organization_id)
      organization_response = node_call('organizations/' + organization_id)
      return nil unless organization_response

      organization = JSON.parse(organization_response)
      return nil unless organization

      {
        organization_id:  organization['id'],
        organization_name: organization['name']
      }
    end

    def get_client
      client_response = node_call("clients")
      return nil unless client_response

      clients_hash = JSON.parse(client_response)
      client_list = clients_hash['clients']
      return nil unless client_list

      client = client_list.find { |x| x['project_id'] == @project_id.to_i }
      return nil unless client

      {
        client_id:  client['id'],
        client_lastname: client['lastname']
      }
    end


    def node_call(url)
      response = RestClient.get 'http://localhost:9090/' + url
      return response.body if response.code == 200
      nil
    end

  end
end
