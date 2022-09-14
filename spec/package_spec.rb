require 'rspec'

describe Package do
  context "initialize" do
    before(:each) do
      package = Package.new("TELNET", ["TCPIP", "NETCARD"])
    end 

    it 'is a package' do
      expect(package).to be_a Package
    end

    it 'can read package name' do
      expect(package.name).to eq("TELNET")
    end 

    it 'can read package dependencies' do
      expect(package.dependencies).to eq(["TCPIP", "NETCARD"])
    end 
  end 
end 
