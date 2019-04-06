require 'pry'

class Transfer

attr_reader(:sender, :receiver)
attr_accessor(:amount, :status)


def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
end


  def valid?
    sender.valid? == true && receiver.valid? == true
  end

#for the longest, self.sender.balance was not compared to self.amount
#                       (1000)                              (50)
#because you have to check that the sender.balance is greater than the amount they want to take out (sufficient funds).
  def execute_transaction
    if sender.valid? && self.sender.balance > self.amount && @status != "complete"
      receiver.balance += @amount
      sender.balance -= @amount
        @status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      receiver.balance -= @amount
      sender.balance += @amount
      @status = "reversed"
    end
  end
end
