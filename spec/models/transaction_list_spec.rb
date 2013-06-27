require "spec_helper"
require_relative "../fixtures/transactions_hash.rb"

describe TransactionList do

  it "initializes with pagination information and transactions" do
    transaction = TransactionList.new(TRANSACTIONS_HASH)
    transaction.current_page.should == 1
    transaction.count.should == 6 
  end

  it "returns the correct csv string" do
    transaction = TransactionList.new(TRANSACTIONS_HASH)
    transaction.to_csv.should == "id,transaction_type,balance,memo\n006c1c84-d919-4654-ae6e-5b34289e2f6a,Debit,59.99,GameStop\n713728fe-2f27-4b5f-8b1d-5099431fbdcc,Debit,200.0,Check #125\n51d77668-0619-48dc-b99c-16578df612b3,Credit,2809.85,Company Payroll\necb3ad20-9992-4dac-a646-798cdb494671,Debit,35.45,California Pizza Kitchen\nb95f99f1-5410-49bf-8451-dce7cef62dd8,Debit,160.48,Progressive Insurance\n9def2513-3e79-4422-8942-7506be6cef0b,Debit,45.63,Dicks Sporting Goods\n"
  end

end
