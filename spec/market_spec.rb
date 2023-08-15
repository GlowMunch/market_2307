require 'spec_helper'

RSpec.describe "Market" do
  describe "Markets have attributes" do
    before :each do
      market_data
    end

    describe "Make a Market" do
      it "has a name" do
        @market = Market.new("South Pearl Street Farmers Market")
        expect(@market.name).to eq("South Pearl Street Farmers Market")
        expect(@market.vendors).to eq([])
      end
    end

    it "can add vendors" do
      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
      expect(@market.vendors_that_sell(@item_4)).to eq([@vendor2])
      expect(@market.vendors_that_sell(@item_1)).to eq([@vendor1, @vendor3])
    end

    it "can return all market inventory" do

      expected_result = {
        "Peach"=>{:quantity=>100, :vendors=>["Rocky Mountain Fresh", "Palisade Peach Shack"]},
        "Tomato"=>{:quantity=>51, :vendors=>["Rocky Mountain Fresh", "Ba-Nom-a-Nom"]},
        "Banana Nice Cream"=>{:quantity=>50, :vendors=>["Ba-Nom-a-Nom"]},
        "Peach-Raspberry Nice Cream"=>{:quantity=>25, :vendors=>["Ba-Nom-a-Nom"]}
      }

      expect(@market.total_inventory).to be_a(Hash)
      expect(@market.total_inventory).to eq(expected_result)
    end

    it "sorts inventory" do
      expected_result = ["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"]
      expect(@market.sorted_items_list).to eq(expected_result)
    end

    it "finds overstoced items" do
      expected_result = [["Peach", {:quantity=>100, :vendors=>["Rocky Mountain Fresh", "Palisade Peach Shack"]}], ["Tomato", {:quantity=>51, :vendors=>["Rocky Mountain Fresh", "Ba-Nom-a-Nom"]}]]
      expect(@market.overstocked_items).to eq(expected_result)
    end

  end
end