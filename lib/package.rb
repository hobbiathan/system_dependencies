class Package
  attr_reader :name, :dependencies, :install_status

  def initialize(name, dependencies)
    @name = name
    @dependencies = dependencies
    @install_status = false
  end 

  def install
    puts "    Installing #{@name}."
    @install_status = true
  end 

  def uninstall
    puts "    Uninstalling #{@name}."
    @install_status = false
  end 
end 
