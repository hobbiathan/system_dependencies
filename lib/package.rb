class Package
  attr_reader :name, :dependencies

  def initialize(name, dependencies)
    @name = name
    @dependencies = dependencies
  end 
end 
