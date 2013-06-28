class User

  def id
    "nakort"
  end

  def accounts
    @accounts ||= geezeo_api.accounts_for_user(self).map{|ac| Account.new(ac.merge(:user => self))}
  end

  def find_account(id)
    accounts.find{|account| account.id == id}
  end

  def total_balance
    accounts.inject(0.0){|total, account| total + account.balance}
  end

  def transactions
    @transactions ||= TransactionList.new(geezeo_api.transactions_for_user(self))
  end

  private

  def geezeo_api
    @geezeo_api ||= GeezeoApi.new(AppConfig[:api_key])
  end

end
