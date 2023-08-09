require 'rspec'
require './lib/maket'

RSpec.desribe "Maket" do
  it "has a name" do
    maket = Maket.new("Apple", 1)
  end
end