require "pry"
class BankAccount
    attr_reader :name
    attr_accessor :balance, :status, :transfer

    def initialize(name, balance=1000)
        @name = name
        @balance = balance
        @status = "open"
    end

    def deposit(money)
        @balance = balance + money
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def valid?
        valid_account = @status == "open" && @balance > 0
    end

    def close_account
       self.status = "closed"
    end

end
