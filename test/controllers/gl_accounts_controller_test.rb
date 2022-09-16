require "test_helper"

# command for running tests
# rails test test/controllers/gl_accounts_controller_test.rb

class GlAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should create a gl_account" do
    assert_difference("GlAccount.count") do 
      post gl_accounts_path, params: { gl_account: { number: 9999, name: "Ahoy!", gl_type: "income" } }, as: :json
    end

    assert_response :success
  end
end
