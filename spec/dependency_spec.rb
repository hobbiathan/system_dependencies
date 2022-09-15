require 'rspec'
require './lib/dependency'

RSpec.describe Dependency do
  describe 'it exists' do
    before(:each) do 
      @dp = Dependency.new("TCPIP")
    end  

    it 'is of type Dependency' do
      expect(@dp).to be_a Dependency
    end 

    it 'can read dependency name' do
      expect(@dp.name).to eq("TCPIP")
    end 

    it 'has a default install status of false' do
      expect(@dp.install_status).to be false
    end 

    it 'has default install count of 0' do
      expect(@dp.install_count).to eq(0)
    end
  end 
end 
