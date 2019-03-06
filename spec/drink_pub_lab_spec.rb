require('minitest/autorun')
require('minitest/rg')
require_relative('../pub_lab')
require_relative('../drink_pub_lab')


class DrinkTest < MiniTest::Test

  def setup
    @drink = Drink.new("cider", 3)
  end

  def test_drink_name
    assert_equal("cider", @drink.drink_name)
  end

  def test_drink_price
    assert_equal(3, @drink.price)
  end 

end
