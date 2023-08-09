require "rspec"
require "./lib/vendor"

RSpec.describe "Vendor" do
  it "has a name" do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor.name).to eq("Rocky Mountain Fresh")
  end
end
