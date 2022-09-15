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

  def install
    puts "Installing #{@name}"
    @install_status = true
  end 

  def uninstall
    if @install_count > 0
      puts "#{@name} is still needed."
    else
      puts "Removing #{@name}."
      @install_status = false
    end 
  end 
end 
