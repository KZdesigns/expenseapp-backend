require "test_helper"

# command for running tests
# rails test test/controllers/gl_accounts_controller_test.rb

class GlAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should retrieve all gl_accounts" do 
    get gl_accounts_url
    assert_equal "index", @controller.action_name
    assert_response :success
  end


  test "should create a gl_account" do
    assert_difference("GlAccount.count") do 
      post gl_accounts_path, params: { gl_account: { number: 9999, name: "Ahoy!", gl_type: "income" } }, as: :json
    end

    assert_response :success
  end

  test "should update a existing gl_account" do
    gl_account = gl_accounts(:one)
    patch gl_account_url(gl_account), params: { gl_account: { id: gl_account[:id], number: 9999, name: "update", gl_type: "expense"} }
    gl_account.reload
    assert_equal 9999, gl_account.number
    assert_response :success
  end

end
