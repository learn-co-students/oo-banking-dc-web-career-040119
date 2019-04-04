class BankAccount

  attr_reader :name
  attr_accessor :balance,:status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    self.balance += money
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open"
  end

  def close_account
    self.status = "closed"
  end 

end

# bank_account = BankAccount.new ("Lige")
# bank_account.balance = 10
# bank_account.status = "open"
# puts bank_account.status
# puts bank_account.balance
# puts bank_account.valid?
