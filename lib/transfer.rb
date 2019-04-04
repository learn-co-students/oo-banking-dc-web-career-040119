require "pry"
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.sender.balance > self.amount && self.status != 'complete'
      self.sender.deposit(-1 * self.amount)
      self.receiver.deposit(self.amount)
      self.status = 'complete'
      # binding.pry
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && self.receiver.balance > self.amount && self.status == 'complete'
      self.sender.deposit(self.amount)
      self.receiver.deposit(-1 * self.amount)
      self.status = 'reversed'
      # binding.pry
    end
  end

end
