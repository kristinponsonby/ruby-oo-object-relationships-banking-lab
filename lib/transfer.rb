require "pry"
class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :bankaccount, :balance, :deposit
 
  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end


  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if  @sender.balance >= @amount && valid? && self.status == "pending"
        @sender.balance = @sender.balance - amount  
        @receiver.balance = @receiver.deposit(amount)
        self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if  @receiver.balance >= @amount && valid? && self.status == "complete"
        @sender.balance = @sender.balance + amount  
        @receiver.balance = @receiver.balance - amount
        self.status = "reversed"
    end
  end


  
end
