class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors.push(vendor)
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def total_inventory
    total_inventory = Hash.new do |hash, key|
      hash[key] = { quantity: 0, vendors: [] }
    end

    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        total_inventory[item[0].name][:quantity] += item[1]
        total_inventory[item[0].name][:vendors] << vendor.name
      end
    end
    total_inventory
  end

  def overstocked_items
    self.total_inventory.find_all do |item|
      item[1][:quantity] > 50
    end
  end

  def sorted_items_list
    sorted_list = Array.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        sorted_list << item[0].name
      end
    end
    sorted_list.uniq.sort
  end

end