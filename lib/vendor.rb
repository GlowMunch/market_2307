class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item.name] == nil
      0
    else
      @inventory[item.name]
    end
  end

  def stock(item, count)
    if @inventory[item.name] == nil
      @inventory[item.name] = count
    else
      @inventory[item.name] += count
    end
  end
end
