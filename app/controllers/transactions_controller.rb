class TransactionsController < ApplicationController

  def index
    send_data(current_user.transactions.to_csv, 
              :type => 'text/csv; charset=utf-8; header=present', 
              :filename => "transactions-#{Time.now.to_date.to_s}.csv")
  end

end
