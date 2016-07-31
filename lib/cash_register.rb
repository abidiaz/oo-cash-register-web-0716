require 'pry'

class CashRegister
attr_accessor :total 
attr_reader :discount, :title, :price, :quantity

  def initialize(*discount)
    @total = 0
    @discount = discount
    @items = []
    end

  def discount
     @discount[0]
  end

  def total 
    @total
  end

  def add_item(title, price, *quantity)
    @price = price #why can't this go in initialize method?
      if quantity[0] != nil
        new_price = @price * quantity[0]
        quantity[0].times do 
          @items.push(title)
        end
      else
        @items.push(title)
        new_price = @price
      end
    @total += new_price
  end

  def apply_discount
    if self.discount != nil
      discount_amount = (@total * @discount[0])/100
      @total = @total - discount_amount
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @price 
  end

end

