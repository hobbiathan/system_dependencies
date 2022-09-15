require 'rspec'
require '../lib/dependency'

RSpec.describe Dependency do
  describe 'it exists' do
    before(:each) do 
      @dp = Dependency.new("TCPIP")
    end 
  end 

  it 'is of type Dependency' do
    expect(@dp).to be_a Dependency
  end 

  it 'can read dependency name' do
    expect(@dp.name).to eq("TCPIP")
  end 
end 
