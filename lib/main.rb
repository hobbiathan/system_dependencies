require 'pry'
require_relative './package'
require_relative './dependency'

#soup time

# Input fed as a text file
file = File.open(ARGV[0], "r")

packages = {}
dependencies = {}

file.each_line do |line|
  # Get command 
  command = line.split[0] 
  # Get package name
  package = line.split[1]
  # Get package dependencies
  dependants = line.split.slice(2..)

  case command

  when "DEPEND"

    puts "#{command} #{package} #{dependants.join(" ")}"
    
    # Initialize package object
    package_obj = Package.new(package, [])

    # Store name of dependencies in Package dependency array
    dependants.each do |dependency|
      package_obj.dependencies << dependency

      # Turn dependencies into their own objects
      dep_object = Dependency.new(dependency)

      # If dependency does not exist in hash, create and add +1 to the installation count
      # Installation count isn't really a good name, it's more like number of packages dependent on said dependency 
      if dependencies[dep_object].nil?
        dep_object.plusone
        dependencies[dependency] = dep_object
      else
        # If object exists in hash, add one to dependency count
        dependencies[dependency].plusone
      end 
    end 

    # Store package in package array
    packages[package] = package_obj

  when "INSTALL"
    # Misnomer to say this is a "package" when you can be installing dependencies
    puts "#{command} #{package}" 

    # Check if "package" is dependency, if key isn't found in dependency hash, move to package hash
    if dependencies[package].nil?

      # If something is going to be installed that wasn't specified to have dependents, or isn't a dependent itself, you
      # just immediately initialize it as a package, install it, then store it.
      if packages[package] == nil && dependencies[package] == nil
        p = Package.new(package, nil)
        p.install
        packages[package] = p 
      elsif packages[package].install_status == true
        puts "    #{package} is already installed."
      else
        # Check package dependencies against dependency hash, install of necessary, otherwise don't.
        packages[package].dependencies.each do |dependency|
          if dependencies[dependency].install_status == true
            # Add 1+ to dependency count
            # Something about this feels like it's going to explode at some point
            # That being said, dependency count is only modified when checking through dependency array
            dependencies[dependency].plusone
            puts "    #{dependency} is already installed."
          else
            dependencies[dependency].plusone
            dependencies[dependency].install
          end 
        end 
      end 
        packages[package].install
    else
      if dependencies[package].install_status == true
        dependencies[package].plusone
        puts "    #{dependencies[package].name} is already installed."
      else
        dependencies[package].plusone
        dependencies[package].install
      end 
    end 
  end  
end 
