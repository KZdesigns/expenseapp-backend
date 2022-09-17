require "test_helper"

# command for running tests
# rails test test/controllers/transactions_controller_test.rb

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should retrieve all transactions" do 
    get transactions_path
    assert_equal "index", @controller.action_name
    assert_response :success
  end


  test "should create a new transaction" do
    assert_difference("Transaction.count") do 
      gl_account_id = gl_accounts(:one).id
      post transactions_path, params: { transaction: 
          { 
            date: "09-14-2022", 
            amount: 10.0, 
            description: "test this", 
            request: "yes", 
            gl_account_id: gl_account_id 
          } 
        }, as: :json
    end
    assert_response :success
  end

  test "should update a existing transaction" do
    transaction = transactions(:one)
    patch transaction_url(transaction), params: { 
      transaction: 
        { 
          id: transaction[:id], 
          date: "09-14-2022", 
          amount: 10.0, 
          description: "test this", 
          request: "yes", 
          gl_account_id: transaction.gl_account_id
        } 
      }
    transaction.reload
    assert_equal "09-14-2022", transaction.date
    assert_equal 10.0, transaction.amount
    assert_equal "test this", transaction.description
    assert_response :success
  end

  test "should destroy a transaction" do 
    transaction = transactions(:three)
    assert_difference("Transaction.count", -1) do
      delete transaction_url(transaction), params: { 
        transaction: 
        { 
          id: transaction[:id], 
          date: transaction[:date], 
          amount: transaction[:amount], 
          description: transaction[:description], 
          request: transaction[:request], 
          gl_account_id: transaction[:gl_account_id] 
        } 
      }
    end
    assert_redirected_to transactions_path
  end
end
