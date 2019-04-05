require_relative "bank_account.rb"
require "pry"
class Transfer
  # your code here
  #attr_reader
  attr_accessor :amount, :status, :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?

  end



  def execute_transaction
    if self.valid? && (self.sender.balance >= self.amount) && @status != "complete"
      self.receiver.deposit(self.amount)
      self.sender.balance -= self.amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.balance -= self.amount
      @status ="reversed"
    end

  end


end
