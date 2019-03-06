require('minitest/autorun')
require('minitest/rg')
require_relative('../pub_lab')
require_relative('../drink_pub_lab')
require_relative('../customer_pub_lab')


class PubTest < MiniTest::Test

  def setup()
    @pub = Pub.new("4042", [], 10)
    @customer =Customer.new("Maria", 20, 24)
    @customer_kid =Customer.new("Billy", 20, 13)
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

  def test_pub_name
    assert_equal("4042", @pub.pub_name)
  end

  def test_money_in_till_count()
    assert_equal(10, @pub.till)
  end

  def test_drinks_in_pub_count()
    assert_equal(5, @pub.drink_count())
  end

  def test_add_drink_to_pub()
    @pub.add_drink_to_pub(@drink1)
    @pub.add_drink_to_pub(@drink2)
    @pub.add_drink_to_pub(@drink3)
    @pub.add_drink_to_pub(@drink4)
    @pub.add_drink_to_pub(@drink5)
    assert_equal(10, @pub.drink_count)
  end

  def test_sold_drink()
    @pub.sold_drink(@drink5)
    @pub.sold_drink(@drink4)
    assert_equal(3, @pub.drink_count)
  end

  def test_add_money_to_till()
    @pub.add_money_to_till(@drink1)
    assert_equal(14, @pub.till)
  end

  def test_transaction_success()
    # @customer.remove_money(@drink1)
    # @pub.add_money_to_till(@drink1)
    @pub.transaction(@customer, @drink1, @pub)
    assert_equal(16, @customer.wallet)
    assert_equal(14, @pub.till)
  end

  def test_transaction_failure()
    # @customer.remove_money(@drink1)
    # @pub.add_money_to_till(@drink1)
    @pub.transaction(@customer_kid, @drink1, @pub)
    assert_equal(20, @customer_kid.wallet)
    assert_equal(10, @pub.till)
  end

end
