require "rspec"
require "./lib/item"
require "./lib/market"
require "./lib/vendor"

RSpec.describe "Vendor" do
  let(:vendor) { Vendor.new("Rocky Mountain Fresh") }
  let(:item_1) { Item.new({name: 'Peach', price: "$0.75"}) }
  let(:item_2) { Item.new({name: 'Tomato', price: '$0.50'}) }

  it "has a name" do
    expect(vendor.name).to eq("Rocky Mountain Fresh")
  end

  it "can have inventory" do
    expect(vendor.inventory).to eq({})
    expect(vendor.check_stock(item_1)).to eq(0)
    vendor.stock(item_1, 30)
    expect(vendor.check_stock(item_1)).to eq(30)
  end

  it "can add items to inventory" do
    vendor.stock(item_1, 30)
    vendor.stock(item_1, 25)
    vendor.stock(item_2, 12)
    expect(vendor.check_stock(item_1)).to eq(55)
    expect(vendor.check_stock(item_2)).to eq(12)

    expect(vendor.inventory).to eq({"Peach"=>55, "Tomato"=>12})
  end
end
