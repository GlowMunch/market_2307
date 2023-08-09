require "spec_helper"

RSpec.describe "Vendor" do
  before :each do
    market_data
  end
  it "has a name" do
    expect(@vendor1.name).to eq("Rocky Mountain Fresh")
  end

  it "can have inventory" do
    expect(@vendor1.inventory).to eq({})
    expect(@vendor1.check_stock(@item_1)).to eq(0)
    @vendor1.stock(@item_1, 30)
    expect(@vendor1.check_stock(@item_1)).to eq(30)
  end

  it "can add items to inventory" do
    @vendor1.stock(@item_1, 30)
    @vendor1.stock(@item_1, 25)
    @vendor1.stock(@item_2, 12)
    expect(@vendor1.check_stock(@item_1)).to eq(55)
    expect(@vendor1.check_stock(@item_2)).to eq(12)

    expect(@vendor1.inventory).to eq({@item_1 => 55, @item_2 => 12})
  end


  it "can calculate revenue" do
    @vendor1.stock(@item_1, 35)
    @vendor1.stock(@item_2, 7)
    @vendor2.stock(@item_4, 50)
    @vendor2.stock(@item_3, 25)
    @vendor3.stock(@item_1, 65)
    expect(@vendor1.potential_revenue).to eq(29.75)
    expect(@vendor2.potential_revenue).to eq(345.00)
    expect(@vendor3.potential_revenue).to eq(48.75)
  end
end
