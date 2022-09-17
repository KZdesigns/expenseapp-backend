class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token #only for local dev need to learn how to pass auth token

    def index
        @transactions = Transaction.all
        render json: @transactions
    end

    def create
        @transaction = Transaction.new(transaction_params)
        if @transaction.save
            render json: @transaction, status: :created
        else 
            render json: @transaction.errors, status: :unprocessable_entity
        end
    end

    def update
        @transaction = Transaction.find(transaction_params[:id])
        if @transaction.update(transaction_params)
            render json: @transaction, status: :ok
        else 
            render json: @transaction.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @transaction = Transaction.find(transaction_params[:id])
        @transaction.destroy
        redirect_to action: "index"
    end

    private 

    def transaction_params
        params.require(:transaction).permit(:id, :date, :amount, :description, :request, :gl_account_id)
    end
end
