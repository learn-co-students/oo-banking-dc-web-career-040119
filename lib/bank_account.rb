class BankAccount

<<<<<<< HEAD
	attr_reader :name
	
	def initialize(name)
		@name = name
	end 
=======
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit (money)
    self.balance += money
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.status = "closed"
  end

>>>>>>> e1bcce961b8746b896a755b0d063e24141fd58a2
end



#checks the validity of the accounts before the transaction occurs
#transfer instances should be able to reject a transfer if the accounts aren't valid or if the sender doesn't have money
