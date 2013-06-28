require "spec_helper"
require_relative "../fixtures/accounts_hash.rb"
require_relative "../fixtures/transactions_hash.rb"

feature 'Transactions' do

  let(:user) {User.new}

  before :each do
    visit account_path(user.accounts.first.id)
  end

  scenario "lists an accounts transactions" do
    page.should have_content('Transactions')
    TRANSACTIONS_HASH[:transactions].each do |transaction|
      page.should have_content(transaction["memo"])
      page.should have_content(transaction["balance"])
    end
  end

  scenario "has pagination and allows traversing" do
    page.should have_selector('div.pagination')
    click_link "2" 
    page.should have_content('Discount Liquors')
    page.should have_content('27.42')
  end

  scenario "csv file of latest transactions" do
    page.should have_content('Transactions')
    click_link "Download CSV"
    page.body.should == user.accounts.first.all_transactions.to_csv
  end
end
