require_relative 'component'

class Product < Component

  attr_reader :name

  EXEMPTS = %w[book chocolates pills].freeze

  def initialize(name, price)
    @name = name
    @price = price
    @import = name.include?('imported')
    @exempt = (EXEMPTS & name.split(' ')).length > 0
  end

  def tax_rate
    tax = 0
    if @import
      tax += 0.05
    end
    unless @exempt
      tax += 0.10
    end
    tax
  end

  def tax
    round_to_nearest_5_cents(@price * tax_rate_percent / 100)
  end

  def total
    (@price + tax).round(2)
  end

  private

  def round_to_nearest_5_cents(number)
    (number * 20).ceil / 20.0
  end

  def tax_rate_percent
    tax_rate * 100
  end
end
