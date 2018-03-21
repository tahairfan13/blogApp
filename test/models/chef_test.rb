require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @chef=Chef.new(chefname:"kamwal",email:"kanwal@gmail.com")
  end

  test "chef should be valid" do
    assert @chef.valid?
  end

  test "chef name should be valid" do
    @chef.chefname=""
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email=""
    assert_not @chef.valid?
  end

  test "chef name should not be > 35" do
    @chef.chefname="a"*36
    assert_not @chef.valid?
  end

  test "email must not be greater > 255" do
    @chef.email="a"*256
    assert_not @chef.valid?
  end

  test "should reject invalid addresses" do
    invalid_emails = %w[mashrur@example mashrur@example,com mashrur.name@gmail. joe@bar+foo.com]
    invalid_emails.each do |invalids|
      @chef.email = invalids
      assert_not @chef.valid?, "#{invalids.inspect} should be invalid"
    end
  end

  test "email should be unique and case insensitive" do
    duplicate_chef = @chef.dup
    duplicate_chef.email = @chef.email.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end

end
