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


  describe 'methods' do
    before(:each) do
      @dp = Dependency.new("SSH")
    end

    it 'can add one to install_count' do
      expect(@dp.install_count).to eq(0)

      @dp.plusone

      expect(@dp.install_count).to eq(1)
    end

    it 'can remove one to intall_count' do
      @dp.plusone
      expect(@dp.install_count).to eq(1)

      @dp.minusone
      expect(@dp.install_count).to eq(0)
    end 

    it 'can change install_status (true)' do
      @dp.install
      expect(@dp.install_status).to eq(true)
    end 

    it 'can change install_status (false)' do
      @dp.plusone
      @dp.install
      @dp.uninstall
      expect(@dp.install_status).to eq(true)
      
      @dp.minusone
      @dp.uninstall
      expect(@dp.install_status).to eq(false)
    end 
  end 
end 
