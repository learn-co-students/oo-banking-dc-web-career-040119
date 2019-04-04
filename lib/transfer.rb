require 'pry'
class Transfer
  # your code here

    attr_accessor :sender, :receiver, :status, :amount
    def initialize(account1, account2, amount)
      @sender= account1
      @receiver= account2
      @amount= amount
      @status= 'pending'
    end

      def valid?
        if self.sender.valid? && self.receiver.valid?
            true
        end
      end

      def execute_transaction
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount


        # if sender_balance && receiver_balance
        self.status= 'complete'
        self.sender.balance
        # end
      end

end
