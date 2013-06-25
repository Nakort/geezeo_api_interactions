class AccountsController < ApplicationController

  def index
    @accounts = current_user.accounts
  end

  def show
    @account = current_user.find_account(params[:id].to_i)
    @accounts = current_user.accounts
    @accounts.delete(@account)
  end
end
