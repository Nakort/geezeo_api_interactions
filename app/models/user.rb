class User

  def id
    "nakort"
  end

  def accounts
    @accounts ||= geezeo_api.accounts_for_user(self).map{|ac| Account.new(ac.merge(:user => self))}
  end

  private

  def geezeo_api
    @geezeo_api ||= GeezeoApi.new(AppConfig[:api_key])
  end

end
