require "spec_helper"
require_relative "../fixtures/transactions_hash.rb"

describe TransactionList do

  it "initializes with pagination information and transactions" do
    transaction = TransactionList.new(TRANSACTIONS_HASH[0], TRANSACTIONS_HASH[1])
    transaction.current_page.should == 1
    transaction.count.should == 6 
  end

end
