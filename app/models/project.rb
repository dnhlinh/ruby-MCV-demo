class Project
    $list = [{:project_name => "Project A", :organization_id => "3", :id => 1},
             {:project_name => "Project B", :organization_id => "2", :id => 2},
             {:project_name => "Project C", :organization_id => "1", :id => 3}] 

    def self.list
        $list
    end
        
    def self.get_by_id(idvalue)
        $list.find {|x| x[:id] == idvalue}
    end

    def self.save(jsonProject)
        prj = JSON.parse(jsonProject)
        $list.push(prj)
    end

    def self.delete(idvalue)
        $list.delete_if {|x| x[:id] == idvalue}
    end
end