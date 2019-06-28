class Client
  $list = [
    { :firstname => "Linh", :lastname => "Do", :project_id => 3, :id => 1 },
    { :firstname => "Peter", :lastname => "Pan", :project_id => 2,:id => 2 },
    { :firstname => "Matt", :lastname => "Bera", :project_id => 1,:id => 3 }
  ]

  def self.list
    $list
  end

  def self.get_by_id(idvalue)
    $list.find { |x| x[:id] == idvalue }
  end

  def self.save(client)
    $list.push(client)
  end

  def self.delete(idvalue)
    $list.delete_if { |x| x[:id] == idvalue }
  end
end
