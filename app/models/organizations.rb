class Organizations
    @list = [{:organization => "Org A", :id => 1},
             {:organization => "Org B", :id => 2},
             {:organization => "Org C", :id => 3}] 

    def self.list
        @list
    end
        
    def self.get_by_id(idvalue)
        Org = @list.find {|x| x[:id] == idvalue}
        Org
        
    end

    def self.save(jsonOrg)
        org = JSON.parse(jsonOrg)
        @list.push(org)
    end

    def self.delete(idvalue)
        @list.delete_if {|x| x[:id] == idvalue} 
    end
end