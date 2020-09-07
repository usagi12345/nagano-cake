module ApplicationHelper

  def price_tax(price)
    price = price * 1.1
    "#{price.floor}"
  end
end
