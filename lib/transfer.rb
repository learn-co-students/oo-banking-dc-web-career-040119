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


       if self.sender.valid? && self.receiver.valid?
         if self.sender.balance > amount &&  self.status != "complete"
            self.sender.balance -= amount
            self.receiver.balance += amount
              self.status = "complete"
            return self.sender.balance
          else
            self.status = "rejected"
            return "Transaction rejected. Please check your account balance."
          end

        end

      end



      def reverse_transfer
         # binding.pry
       self.execute_transaction
       self.receiver.balance -= amount
       self.sender.balance +=amount
        self.status = "reversed"
       # binding.pry
      end

end
