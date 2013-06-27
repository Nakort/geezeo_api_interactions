require "spec_helper"
require_relative "../fixtures/accounts_hash.rb"
require_relative "../fixtures/transactions_hash.rb"

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

  scenario "csv file of latest transactions" do
    user = User.new
    visit account_path(user.accounts.first.id)
    page.should have_content('Transactions')
    click_link "Download CSV"
    page.body.should == user.accounts.first.transactions.to_csv
  end
end
