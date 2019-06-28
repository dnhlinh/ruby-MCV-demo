class Instance

# project_id
# (node)
# project name
# organization id & name
# client id & lastname

  $list = []

  def self.list
    $list
  end

  def self.get_by_id(idvalue)
    $list.find { |x| x[:id] == idvalue }
  end

  def self.save(instance)
    $list.push(instance)
    instance
  end

  def self.delete(idvalue)
    $list.delete_if { |x| x[:id] == idvalue }
  end
end
