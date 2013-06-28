class AccountsController < ApplicationController

  def index
    @accounts = current_user.accounts
  end

  def show
    @account = current_user.find_account(params[:id].to_i)
    @transactions = @account.transactions(params.fetch(:page, 1).to_i)
    @accounts = current_user.accounts
    @accounts.delete(@account)
  end

  def transactions
    account = current_user.find_account(params[:id].to_i)
    send_data(account.all_transactions.to_csv, 
              :type => 'text/csv; charset=utf-8; header=present', 
              :filename => "transactions-#{Time.now.to_date.to_s}.csv")
  end
end
