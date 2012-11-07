require "forwardable"

module Addressable
  extend Forwardable

  attr_accessor :name, :address
  def_delegators :address, :street, :city, :country, :postal_code, :phone

  def initialize(name, address = nil)
    @name = name
    @address = (address || Address.new)
  end
end

class Customer
  include Addressable
end

class Owner
  include Addressable
end