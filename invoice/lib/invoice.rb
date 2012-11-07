require "forwardable"
require "prawn"
require_relative "pdf_generator"

class Invoice
  extend Forwardable

  attr_accessor :id, :issue_date, :due_date, :tax, :discount,
                :currency, :owner, :services, :customer

  def_delegator :customer, :name, :customer_name
  def_delegator :customer, :address, :customer_address

  def_delegator :owner, :name, :owner_name
  def_delegator :owner, :address, :owner_address

  def initialize(options = {})
    @id         = options[:id]
    @due_date   = options[:due_date]
    @issue_date = options[:issue_date]
  end

  def currency
    @currency ||= "R$"
  end

  def tax
    @tax ||= 0.06
  end

  def discount
    @discount ||= 0
  end

  def subtotal
    services.inject(0) { |sum, item| sum += item.amount }
  end

  def amount
    (subtotal + taxes_amount) - discount
  end

  def to_pdf(destination = ".")
    PDFGenerator.new(self).create!(destination)
  end

  private

  def taxes_amount
    (subtotal * tax)
  end
end