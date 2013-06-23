class Account 
  
  attr_accessor :id, :name, :balance, :reference_id, :aggregation_type,
                :state, :harvest_updated_at, :account_type, :fi, :user


  def initialize(attrs={})
    attrs.each{|k,v| send("#{k}=",v)}
  end

  def ==(other_account)
    other_account.id == self.id
  end

  def transactions
    @transactions ||= TransactionList.new(geezeo_api.transactions_for_user_account(self.user, self))
  end

  def balance=(attr)
    @balance = Float(attr)
  end

  private

  def geezeo_api
    @geezeo_api ||= GeezeoApi.new(AppConfig[:api_key])
  end

end
