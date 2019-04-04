require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?(*people)
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if !@@all.include?(self) && self.valid? && self.sender.balance > self.amount
      # binding.pry
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      @@all << self
    else #self.valid? == false
      # binding.pry
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end


#Transfers start out in a "pending" status. They can be executed and go to a "complete" state. They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status.
