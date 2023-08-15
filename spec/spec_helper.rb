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

  @vendor1.stock(@item_1, 35)
  @vendor1.stock(@item_2, 7)
  @vendor2.stock(@item_4, 50)
  @vendor2.stock(@item_3, 25)
  @vendor3.stock(@item_1, 65)
  @vendor2.stock(@item_2, 44)
  @market.add_vendor(@vendor1)
  @market.add_vendor(@vendor2)
  @market.add_vendor(@vendor3)

end