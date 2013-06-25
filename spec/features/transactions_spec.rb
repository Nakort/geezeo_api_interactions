require "spec_helper"
require_relative "../fixtures/accounts_hash.rb"

feature 'Transactions' do

  scenario "lists an accounts transactions" do
    user = User.new
    visit account_path(user.accounts.first.id)
    page.should have_content('Transactions')
    TRANSACTIONS_HASH[:transactions].each do |transaction|
      page.should have_content(transaction["memo"])
      page.should have_content(transaction["balance"])
    end
  end
end
