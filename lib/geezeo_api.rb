class GeezeoApi

  attr_reader :api_key

  def initialize(api_key)
    @api_key = api_key
  end

  def accounts_for_user(user)
    fetch_accounts(user)
  end

  def transactions_for_user_account(user, account, page=1)
    fetch_transactions(user, account, page)
  end

  def transactions_for_user(user)
    transactions = []
    hydra = Typhoeus::Hydra.hydra
    user.accounts.each do |account|
      _all_transactions_for_user_account(user, account, hydra, transactions)
    end
    hydra.run
    {:transactions => transactions.flatten , :pagination => {} }
  end

  def all_transactions_for_user_account(user, account)
    transactions = []
    hydra = Typhoeus::Hydra.hydra
     _all_transactions_for_user_account(user, account, hydra, transactions)
    hydra.run
    {:transactions => transactions.flatten , :pagination => {} }
  end

  private
  
  def _all_transactions_for_user_account(user, account, hydra, transactions)
    acc_request = Typhoeus::Request.new(transactions_url(user, account, 1), authentication)
    acc_request.on_complete do |response|
      tr_hash = parse_transactions(response.body)
      transactions << tr_hash[:transactions]
      (tr_hash[:pagination]['total_pages'].to_i - 1).times do |i|
        tr_request = Typhoeus::Request.new(transactions_url(user, account, i + 2), authentication)
        tr_request.on_complete do |response|
          transactions << parse_transactions(response.body)[:transactions]
        end
        hydra.queue(tr_request)
      end
    end
    hydra.queue(acc_request)
  end
   
  def fetch_transactions(user, account, page)
    parse_transactions(Typhoeus.get(transactions_url(user, account, page), authentication).body)
  end

  def transactions_url(user, account, page)
    "#{base_url}/users/#{user.id}/accounts/#{account.id}/transactions?page=#{page}"
  end

  def parse_transactions(response)
    response = JSON.parse(response)
    pages = response['pages']
    transactions = response['transactions'].map { |t| t['transaction'] }
    {:transactions => transactions, :pagination => pages}
  end

  def authentication
    {userpwd: api_key}
  end

  def base_url
    "https://beta-geezeosandbox.geezeo.com/api/v1"
  end

  def fetch_accounts(user)
    url = "#{base_url}/users/#{user.id}/accounts"
    response = Typhoeus.get(url, authentication)
    JSON.parse(response.body)['accounts']
  end
end
