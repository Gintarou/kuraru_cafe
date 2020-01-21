require 'test_helper'

class MenuTest < ActiveSupport::TestCase

  def setup
    @menu = Menu.new(image:"test.jpg", name:"test_menu",
    price:1000, commitment:"test<br>test<br>test", allergy:"卵")
  end

  test "should be valid" do
    assert @menu.valid?
  end

  test "image should be present" do
    @menu.image = " "
    assert_not @menu.valid?
  end

  test "name should be present" do
    @menu.name = " "
    assert_not @menu.valid?
  end

  test "price should be present" do
    @menu.price = nil
    assert_not @menu.valid?
  end

  test "commitment should be present" do
    @menu.commitment = " "
    assert_not @menu.valid?
  end

end
