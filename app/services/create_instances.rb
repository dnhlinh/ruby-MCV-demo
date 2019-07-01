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
      # RETURN CLIENT ID AND LASTNAME
      @getClients = RestClient.get 'http://localhost:9090/clients' # why doesn't this return anything?
      @clientsHash = JSON.parse(@getClients)
      @clientList = @clientsHash['clients']
      @ClientFound = @clientList.find { |x| x['project_id'] == @project_id}
      
      #RETURN PROJECT ID AND NAME
      @getProject = RestClient.get 'http://localhost:9090/projects/' + @project_id
      @ProjectFound = JSON.parse(@getProject)
      
      #RETURN ORGANIZATION ID AND NAME
      @organization_id = @jsonProject['organization_id'] 
      @getOrg = RestClient.get 'http://localhost:9090/organizations/' + @organization_id
      @OrganizationFound = JSON.parse(@getOrg)
      
      output = {
              client_id:  @ClientFound['id'],
              client_lastname: @ClientFound['lastname']
              project_id: @ProjectFound['id'],
              project_name: @ProjectFound['name'],
              organization_id: @OrganizationFound['id'],
              organization_name: @OrganizationFound['name'],
              }
    end
  end
end
