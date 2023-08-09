require 'rspec'
require './lib/market'

RSpec.describe "Market" do
  it "has a name" do
    market = Market.new("South Pearl Street Farmers Market")
    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end
end