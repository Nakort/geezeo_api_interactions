class Account < OpenStruct

  def ==(other_account)
    other_account.id == self.id
  end

  def transactions
    @transactions ||= TransactionList.new(geezeo_api.transactions_for_user_account(self.user, self))
  end

  private

  def geezeo_api
    @geezeo_api ||= GeezeoApi.new(AppConfig[:api_key])
  end

end
