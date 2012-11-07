class Invoice

  attr_accessor :id, :issue_date, :due_date, :tax, :discount,
                :currency, :owner, :services, :customer

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

  def amount
  end

  def subtotal
    5
  end

end