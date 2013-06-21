require "spec_helper"
require_relative "../fixtures/transactions_hash.rb"
require_relative "../fixtures/accounts_hash.rb"

describe GeezeoApi do

  context "accounts for user" do

    it "returns an array of hashes with the information for the user accounts" do
      GeezeoApi.new(AppConfig[:api_key]).accounts_for_user(stub(:id => "nakort")).should == ACCOUNTS_HASH
    end

  end

  context "transactions for accounts" do
    it "returns an array of transactions and the pagination info" do
      GeezeoApi.new(AppConfig[:api_key]).transactions_for_user_account(stub(:id => "nakort"), stub(:id => 4372076)).should == TRANSACTIONS_HASH
    end

  end
end
