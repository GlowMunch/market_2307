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

    it "can add vendors" do
      @vendor1.stock(@item_1, 35)
      @vendor1.stock(@item_2, 7)
      @vendor2.stock(@item_4, 50)
      @vendor2.stock(@item_3, 25)
      @vendor3.stock(@item_1, 65)
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
      expect(@market.vendors_that_sell(@item_4)).to eq([@vendor2])
      expect(@market.vendors_that_sell(@item_1)).to eq([@vendor1, @vendor3])

    end

  end
end