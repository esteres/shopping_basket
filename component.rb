class Component

  def append(component)
    raise NotImplementedError
  end

  def composite?
    false
  end

  def tax_rate
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def tax
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def total
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
