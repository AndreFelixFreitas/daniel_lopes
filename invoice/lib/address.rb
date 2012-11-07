class Address

  attr_accessor :street, :city, :country, :postal_code, :phone

  def initialize(options = {})
    options.each { |key, value| self.send("#{ key }=", value) }
  end

  def to_s
    <<-EOF
    #{ street }, #{ city } - #{ country } - #{ postalcode } #{ phone }
    EOF
  end

  def complete?
    !incomplete?
  end

  def incomplete?
    street.nil? || city.nil? || country.nil? || postal_code.nil? || phone.nil?
  end
end