require('minitest/autorun')
require('minitest/rg')
require_relative('../pub_lab')
require_relative('../drink_pub_lab')
require_relative('../customer_pub_lab')

class CustomerTest < MiniTest::Test

  def setup()
    @customer = Customer.new("Maria", 20, 24)
    @pub = Pub.new("4042", [], 10)
    @drink1 = Drink.new("beer", 4)
    @drink2 = Drink.new("cocktail", 7)
    @drink3 = Drink.new("whiskey", 11)
    @drink4 = Drink.new("gin", 15)
    @drink5 = Drink.new("champagne", 30)
    @pub.add_drink_to_pub(@drink1)
    @pub.add_drink_to_pub(@drink2)
    @pub.add_drink_to_pub(@drink3)
    @pub.add_drink_to_pub(@drink4)
    @pub.add_drink_to_pub(@drink5)
  end

  def test_customer_name
    assert_equal("Maria", @customer.customer_name)
  end

  def test_customer_wallet
    assert_equal(20, @customer.wallet)
  end

  def test_drink_up()
    assert_equal(0, @customer.drink_up)
  end

  def test_customer_age
    assert_equal(24, @customer.age)
  end


  def test_number_of_drinks_customer_has()
    @customer.number_of_drinks_customer_has(@drink1)
    @customer.number_of_drinks_customer_has(@drink2)
    @customer.number_of_drinks_customer_has(@drink3)
    @customer.number_of_drinks_customer_has(@drink4)
    @customer.number_of_drinks_customer_has(@drink5)
    assert_equal(5, @customer.drink_up)
  end

  def test_customer_buy_drink_from_pub
    @customer.customer_buy_drink_from_pub(@pub, @drink1)
    assert_equal(1, @customer.drink_up)
    assert_equal(4, @pub.drink_count)
  end

  def test_wallet_money_when_drink_added
    @customer.remove_money(@drink1)
    assert_equal(16, @customer.wallet)
  end

end
