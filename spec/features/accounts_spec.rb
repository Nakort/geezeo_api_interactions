require "spec_helper"
require_relative "../fixtures/accounts_hash.rb"

feature 'Accounts' do

  scenario "lists a users accounts" do
    visit accounts_path
    page.should have_content('Accounts')
    ACCOUNTS_HASH.each do |account|
      page.should have_content(account["name"])
      page.should have_content(account["balance"])
    end
  end
end
