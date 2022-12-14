class GlAccountsController < ApplicationController
    skip_before_action :verify_authenticity_token #only for local dev need to learn how to pass auth token

    def index
        @gl_accounts = GlAccount.all
        render json: @gl_accounts
    end

    def create
        @gl_account = GlAccount.new(gl_accounts_params)
        if @gl_account.save
            render json: @gl_account, status: :created, location: @gl_account
        else
            render json: @gl_account.errors, status: :unprocessable_entity
        end
    end

    def update
        @gl_account = GlAccount.find(gl_accounts_params[:id])
        if @gl_account.update(gl_accounts_params)
            render json: @gl_account, status: :ok
        else
            render json: @gl_accounts.erros, status: :unprocessable_entity
        end
    end

    private

    def gl_accounts_params
        params.require(:gl_account).permit(:id, :number, :name, :gl_type)
    end

end
