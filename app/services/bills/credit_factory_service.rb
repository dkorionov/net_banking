class CreditFactoryService

  def new_bill

  end

  def create_bill
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def show_all
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def show_bill
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def edit_bill
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def update_bill
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def delete_bill
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end