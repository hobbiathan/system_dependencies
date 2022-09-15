require 'rspec'
require './lib/package'

RSpec.describe Package do
  describe "initialize" do
    before(:each) do
      @package = Package.new("TELNET", ["TCPIP", "NETCARD"])
    end 

    it 'is a package' do
      expect(@package).to be_a Package
    end

    it 'can read package name' do
      expect(@package.name).to eq("TELNET")
    end 

    it 'can read package dependencies' do
      expect(@package.dependencies).to eq(["TCPIP", "NETCARD"])
    end 

    it 'has default install_status of false' do
      expect(@package.install_status).to eq(false)
    end 

    it 'can change install' do
      @package.install
      expect(@package.install_status).to eq(true)
    end 

    it 'can uninstall' do
      @package.install
      expect(@package.install_status).to eq(true)

      @package.uninstall
      expect(@package.install_status).to eq(false)
    end 
  end 
end 
