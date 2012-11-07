require_relative "spec_helper"

describe "Address" do

  def address
    @address ||= begin
      options = {
        street: "Padre",
        city: "Ata",
        country: "Brazil",
        postal_code: "123456",
        phone: "123456"
      }
      Address.new(options)
    end
  end

  it "is complete with all fields filled" do
    address.complete?.should eql true
  end

  it "is complete with one field empty" do
    address.city = nil
    address.incomplete?.should eql true
  end

end