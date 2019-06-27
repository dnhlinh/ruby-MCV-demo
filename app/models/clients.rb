class Client
    @list = [{:firstname => "Linh", :lastname => "Do", :id => 1},
             {:firstname => "Peter", :lastname => "Pan", :id => 2},
             {:firstname => "Matt", :lastname => "Bera", :id => 3}] 

    def self.list
        @list
    end
        
    def self.get_by_id(idvalue)
        Client = @list.find {|x| x[:id] == idvalue}
        Client
        
    end

    def self.save(jsonClient)
        client = JSON.parse(jsonClient)
        @list.push(client)
    end

    def self.delete(idvalue)
        @list.delete_if {|x| x[:id] == idvalue} 
    end
end