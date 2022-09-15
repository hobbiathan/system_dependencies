class Dependency
  attr_reader :name, :install_status, :install_count

  def initialize(name)
    @name = name
    @install_status = false
    @install_count = 0
  end 
end 
