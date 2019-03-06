class Customer
attr_reader :customer_name, :wallet, :age

  def initialize(customer_name, wallet, age)
    @customer_name = customer_name
    @wallet = wallet
    @drink_up = []
    @age = age
  end

  def drink_up
    @drink_up.length
  end

  def number_of_drinks_customer_has(drink)
    @drink_up << drink
  end

  def customer_buy_drink_from_pub(pub, drink)
    drink = pub.sold_drink(drink)
    @drink_up << drink
  end

  def remove_money(drink)
    @wallet -= drink.price
  end
end
