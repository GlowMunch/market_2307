class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item] == nil
      0
    else
      @inventory[item]
    end
  end

  def stock(item, ammount)
    if @inventory[item] == nil
      @inventory[item] = ammount
    else
      @inventory[item] += ammount
    end
  end

  def potential_revenue
    @inventory.map do |revenue|
      revenue[0].price * revenue[1]
    end.sum
  end
end
