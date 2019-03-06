class Pub
attr_reader :pub_name, :drinks
attr_accessor :till

 def initialize(pub_name, drinks, till)
   @pub_name = pub_name
   @drinks = drinks
   @till = till
 end

 def drink_count
   @drinks.length()
 end

 def add_drink_to_pub(drink)
   @drinks << drink
 end

 def sold_drink(drinks)
    @drinks.delete_if{|drink| drink == drinks}
  end

  def add_money_to_till(drink)
    @till += drink.price
  end

  def transaction(customer, drink, pub)
    if customer.age > 18
      customer.customer_buy_drink_from_pub(pub, drink)
      pub.sold_drink(drink)
      customer.remove_money(drink)
      pub.add_money_to_till(drink)
    else
      nil
    end
  end

end
