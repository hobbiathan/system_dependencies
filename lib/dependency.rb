class Dependency
  attr_reader :name, :install_status, :install_count

  def initialize(name)
    @name = name
    @install_status = false
    @install_count = 0
  end 

  def plusone
    @install_count += 1
  end

  def minusone
    @install_count -= 1
  end 
end 
