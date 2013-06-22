require 'spec_helper'
require_relative '../fixtures/accounts_hash.rb'

describe User do
  
  let(:user){ User.new}

  it "has an id" do
    user.id.should == "nakort"
  end

  it "has accounts" do
    user.accounts.should == ACCOUNTS_HASH.map{|ac| Account.new(ac)}
  end


  context "find_account" do
    it "returns the account for the given id" do
      account_id = user.accounts.last.id
      user.find_account(account_id).should == user.accounts.last
    end

    it "returns nil when there is account or the given id" do
      user.find_account("some-random").should be_nil
    end
  end
end
