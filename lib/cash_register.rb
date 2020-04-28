
require 'pry'

class CashRegister
  attr_accessor :total, :discount, :last_transaction

  def initialize(discount = 0)
  @total = 0.0
  @discount = discount
  @items = []
  end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        #binding.pry
        if quantity > 0
          count = 0
          while count < quantity
            @items << title
            count += 1
          end
          @last_transaction = price * quantity
          #binding.pry
        end
      end

    def apply_discount
    if @discount > 0
      @discount = @discount/100.to_f
      @total = @total - (@total * (@discount))
      "After the discount, the total comes to $#{@total.to_i}."
      else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    #subtracts the last item from the total
    self.total -= self.last_transaction
    #binding.pry
    #returns the total to 0.0 if all items have been removed
    # if self.items.clear
    #   @total = 0.0
    # end
  end

end
