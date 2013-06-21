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

end
