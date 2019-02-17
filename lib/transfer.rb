require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount, :BankAccount
  attr_reader :name

  def initialize(sender, receiver, amount)

    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      false
    end
  end


  def execute_transaction
    if @sender.valid? && @sender.balance > amount && @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      self.status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      self.status = "reversed"
    else
      "cannot reverse an incomplete transaction"

    end
  end



end
