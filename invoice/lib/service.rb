class Service

  attr_accessor :type, :description , :quantity, :unit_price

  def initialize(options = {})
    @quantity    = (options[:quantity] || 1)
    @type        = options[:type]
    @description = options[:description]
    @unit_price  = (options[:unit_price] || 0)
  end

  def amount
    quantity * unit_price
  end

end