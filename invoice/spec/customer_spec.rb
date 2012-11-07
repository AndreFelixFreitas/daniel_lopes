require_relative "spec_helper"

describe "Customer" do

  before(:each) do
    @customer = Customer.new("Andre Felix")
  end

  it "has a name" do
    @customer.name.should eql "Andre Felix"
  end

  describe "address" do

    it "should delegate address attributes to customer address" do
      params = {
        street: "Padre",
        city: "Ata",
        country: "Brazil",
        postal_code: "123456",
        phone: "123456"
      }
      @customer.address = Address.new(params)
      params.each do |key, value|
        @customer.send(key).should eql value
      end
    end

  end

end