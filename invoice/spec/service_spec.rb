require "spec_helper"

describe Service do

  def service(params = {})
    @service ||= Service.new(params)
  end

  it "has 1 as default quantity" do
    #assert_equal 1, service.quantity
    service.quantity.should eql 1
  end

  it "has unit price multiplied by the quantity as amount" do
    service(unit_price: 3.5, quantity: 2)
    #assert_equal 7.0, service.amount
    service.amount.should eql 7.0
  end

end
