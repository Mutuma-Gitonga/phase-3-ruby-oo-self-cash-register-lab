require 'pry'

class CashRegister
  
  attr_accessor :total, :discount, :items, :transactions

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
    @transactions = []
  end


  def add_item (title, price, quantity = 1)

    self.total += price * quantity

    x = 0 
    until x == quantity do
      self.items << title
      self.transactions << [price, quantity]
      x += 1
    end
    
  end
   

  def apply_discount
    if(discount)
      self.total -= self.total * self.discount/100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end


  def items
    @items
  end

  def void_last_transaction
    self.total -= @transactions.last()[0] * @transactions.last()[1]
  end
  
end 
