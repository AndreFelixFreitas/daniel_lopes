require "spec_helper"

describe Invoice do

  def invoice(params = {})
    @invoice ||= Invoice.new(params)
  end

  describe "defaults" do

    it "has R$ as currency" do
      #assert_equal "R$", invoice.currency
      invoice.currency.should eql "R$"
    end

    it "has 0.06 as tax" do
      #assert_equal 0.06, invoice.tax
      invoice.tax.should eql 0.06
    end

    it "has 0 as discount" do
      #assert_equal 0, invoice.discount
      invoice.discount.should eql 0
    end

  end

  describe "invoice amount calculation" do

    it "has a subtotal without taxes and discounts" do
      #assert_equal 5, invoice.subtotal
      invoice.subtotal.should eql 5
    end
    #it "has an amount with taxes"
    #it "aplies discounts hhen available"

  end

end