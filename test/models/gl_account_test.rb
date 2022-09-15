require "test_helper"

class GlAccountTest < ActiveSupport::TestCase
  # Test for name attribute
  test "name can not be nil" do
    gl = GlAccount.new(name: nil, number: 1000, gl_type: "income") 
    gl.valid?
    assert gl.errors[:name].include?("can't be blank")
  end

  test "name is can not be an empty string" do
    gl = GlAccount.new(name: "", number: 1000, gl_type: "income") 
    gl.valid?
    assert gl.errors[:name].include?("can't be blank")
  end

  test "name is not uniqe" do 
    one = gl_accounts(:one)
    two = gl_accounts(:two)
    one.name = two.name
    assert_not one.valid?
  end

  test "name is unique" do 
    one = gl_accounts(:one)
    two = gl_accounts(:two)
    assert one.valid?
  end

  test "name is less than two characters" do 
    one = gl_accounts(:one)
    one.name = "a"
    assert_not one.valid?
  end

  test "name is equal than two characters" do 
    one = gl_accounts(:one)
    one.name = "aa"
    assert one.valid?
  end

  #TODO: Finish writing tests for gl_account validators, number and type
  test "gl number is required field" do 
    one = gl_accounts(:one)
    one.number = nil
    assert_not one.valid?
  end

  test "gl number cant not be less than 4 characters" do 
    one = gl_accounts(:one)
    one.number = 123
    assert_not one.valid?
  end

  test "gl number should be >= than 4 characters" do 
    one = gl_accounts(:one)
    one.number = 4000
    assert one.valid?
  end

  test "gl number can only be integers" do 
    one = gl_accounts(:one)
    one.number = 4000.00
    assert_not one.valid?
  end

  test "gl number should be unique" do 
    one = gl_accounts(:one)
    two = gl_accounts(:two)
    one.number = two.number
    assert_not one.valid?
  end

  test "gl account type should can only be income or expense" do
    one = gl_accounts(:one)
    two = gl_accounts(:two)
    three = gl_accounts(:three)
    four = gl_accounts(:four)

    one.gl_type = "asset"
    two.gl_type = "income"
    three.gl_type = "expense"
    four.gl_type = "import"

    assert_not one.valid?
    assert two.valid?
    assert three.valid?
    assert four.valid?
  end

end
