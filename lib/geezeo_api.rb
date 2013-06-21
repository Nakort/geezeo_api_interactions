class GeezeoApi

  attr_reader :api_key

  def initialize(api_key)
    @api_key = api_key
  end

  def accounts_for_user(user)
    fetch_accounts(user)
  end

  def fetch_accounts(user)
    url = "#{self.base_url}/users/#{user.id}/accounts"
    response = HTTParty.get(url, authentication)
    JSON.parse(response.body)['accounts']
  end

  def transactions_for_user_account(user, account, page=1)
    fetch_transactions(user, account, page)
  end

  def fetch_transactions(user, account, page)
    url = "#{self.base_url}/users/#{user.id}/accounts/#{account.id}/transactions?page=#{page}"
    response = HTTParty.get(url, authentication).body
    response = JSON.parse(response)
    pages = response['pages']
    transactions = response['transactions'].map { |t| t['transaction'] }
    {:transactions => transactions, :pagination => pages}
  end

  def authentication
    {basic_auth: { username: api_key } }
  end

  def base_url
    "https://beta-geezeosandbox.geezeo.com/api/v1"
  end

end
