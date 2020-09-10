module ApplicationHelper

  def current_cart
    @cart_items = current_end_user.cart_items
  end

  def price_tax(price)
    (price * 1.1).floor
  end

 def sub_price(sub)
    (price_tax(sub.item.price_nontax) * sub.number)
  end

  def total_price(totals)
    price = 0
    totals.each do |total|
      price  +=  sub_price(total)
    end
    return price
  end

  def billing_price(order)
    total_price(current_cart) + @order.postage
  end

end
