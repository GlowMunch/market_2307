require 'spec_helper'

RSpec.describe "Market" do
  describe "Markets have attributes" do
    before :each do
      market_data
    end

    it "has a name" do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
      expect(@market.vendors).to eq([])
    end
  end
end