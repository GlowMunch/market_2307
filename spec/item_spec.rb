require "spec_helper"

RSpec.describe "Item" do
  before :each do
    market_data
  end
  it "has attributes" do
    expect(@item_1.name).to eq("Peach")
    expect(@item_1.price).to eq(0.75)
    expect(@item_2.name).to eq("Tomato")
    expect(@item_2.price).to eq(0.5)
  end
end