require_relative "spec_helper"

describe Invoice do

  def invoice(params = {})
    @invoice ||= begin
      i = Invoice.new(params)
      i.id = 1
      i.services = 5.times.collect { Service.new(unit_price: 1, quantity: 1) }
      i
    end
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

    it "has an amount with taxes" do
      invoice.amount.should eql 5.3
    end

    it "aplies discounts hhen available" do
      invoice.discount = 2
      invoice.amount.should eql 3.3
    end

  end

  it "should have a customer name" do
    invoice.customer = Customer.new("Egenial")
    invoice.customer_name.should eql "Egenial"
  end

  it "should have a owner name" do
    invoice.owner = Owner.new("Andre")
    invoice.owner_name.should eql "Andre"
  end

  describe "pdf conversion" do
    it "creates a pdf for the invoice" do
      invoice.customer = Customer.new("Mola Mestra")
      invoice.owner    = Owner.new("Andre Felix")

      #Dir.mktmpdir do |dir|
        invoice.to_pdf
        #expected = "#{ dir }/1-mola-mestra.pdf"
        #File.file?(expected).should eql true
      #end
    end
  end

end