require 'pry'

class CashRegister
  
  attr_accessor :total, :discount

  @@added_items = []
  @@new_object_created = false
  @@transactions_tracker = []

  def initialize(discount = nil)
    @@new_object_created = true
    @discount = discount
    @total = 0
  end


  def add_item (title, price, quantity = 1)

   


    qty = quantity

    if(@@new_object_created)

      if(@@added_items.empty?())
        while qty > 0
          @@transactions_tracker << [price, quantity]
          @@added_items << title
          qty -= 1
        end
        @@new_object_created = false
      else
        @@transactions_tracker.clear
        @@added_items.clear
        while qty > 0
          @@transactions_tracker << [price, quantity]
          @@added_items << title
          qty -= 1
        end
        @@new_object_created = false
      end
    else

      while qty > 0
        @@transactions_tracker << [price, quantity]
        @@added_items << title
        qty -= 1
      end
    end

    self.total += price * quantity
    
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
    @@added_items
  end

  def void_last_transaction

    self.total -= @@transactions_tracker.last()[0] * @@transactions_tracker.last()[1]
  end
  
end 

# cash_register = CashRegister.new
# cash_register.add_item("apple", 0.99)
# cash_register.add_item("tomato", 1.76)
# binding.pry

# another_register = CashRegister.new
# another_register.add_item("cheese", 2)
# another_register.add_item("rice", 2)
# # binding.pry

# new_register = CashRegister.new
# new_register.add_item("eggs", 1.99, 2)
# new_register.add_item("tomato", 1.76, 3)
# new_register.add_item("cherry", 1.55, 2)
# binding.pry

# third_register = CashRegister.new
# third_register.add_item("Ugali",3)
# third_register.add_item("nduma",3)
# binding.pry

