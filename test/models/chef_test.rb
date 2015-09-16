require 'test_helper'

class ChefTest < ActiveSupport:: TestCase

  def setup
    @chef = Chef.new(chefname: "john", email:"john@example.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chefname shoud be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  test "chefname not be too long" do
    @chef.chefname = "A" * 41
    assert_not @chef.valid?
  end
  
  test "chefname not be too short" do
    @chef.chefname = "A" * 2
    assert_not @chef.valid?
  end
  
  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email length sould be within bounds" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email address should be unique" do
    dup_chef = @chef.dup # Duplicamos el objeto
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valida addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
    valid_addresses.each do |val|
      @chef.email = val
      assert @chef.valid?, "#{val.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalida addresses" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+ar.com]
    invalid_addresses.each do |inval|
      @chef.email = inval
      assert_not @chef.valid?, "#{inval.inspect} should be invalid"
    end
  end
  
end