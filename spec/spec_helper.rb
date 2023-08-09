require 'rspec'
require "./lib/item"
require "./lib/market"
require "./lib/vendor"

def market_data
  @market = Market.new("South Pearl Street Farmers Market")
  @vendor1 = Vendor.new("Rocky Mountain Fresh")
  @vendor2 = Vendor.new("Ba-Nom-a-Nom")
  @vendor3 = Vendor.new("Palisade Peach Shack")
  @item_1 = Item.new({name: 'Peach', price: "$0.75"})
  @item_2 = Item.new({name: 'Tomato', price: "$0.50"})
  @item_3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
  @item_4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

end