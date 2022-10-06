require_relative 'component'

class ProductListComposite < Component

  def initialize
    @children = []
  end

  def append(component)
    @children << component
  end

  def composite?
    true
  end

  def tax_rate
    @children.inject(0) { |sum, child| sum + child.tax_rate }
  end

  def tax
    @children.inject(0) { |sum, child| sum + child.tax }
  end

  def total
    @children.inject(0) { |sum, product| sum + product.total }
  end

  def to_s
    @children.inject({}) do |sum, product|
      sum[product.name] ||= { quantity: 0, total: 0 }
      sum[product.name] = {
        quantity: sum[product.name][:quantity] + 1,
        total: sum[product.name][:total] + product.total
      }
      sum
    end.map do |name, data|
      "#{data[:quantity]} #{name}: %0.2f" % [data[:total]]
    end
  end

  def round_to_nearest_5_cents(number)
    (number * 2.0).round / 2.0
  end
end
