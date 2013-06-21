require "spec_helper"

describe GeezeoApi do

  context "accounts for user" do

    it "returns an array of hashes with the information for the user accounts" do
      GeezeoApi.new(AppConfig[:api_key]).accounts_for_user(stub(:id => "nakort")).should == [{"id"=>4372076, "name"=>"eChecking", "balance"=>"300.54", "reference_id"=>"789274930", "aggregation_type"=>"partner", "state"=>"active", "harvest_updated_at"=>nil, "account_type"=>nil, "fi"=>nil},
                                                                    {"id"=>4372077, "name"=>"Complete Savings", "balance"=>"1000.0", "reference_id"=>"278914032", "aggregation_type"=>"partner", "state"=>"active", "harvest_updated_at"=>nil, "account_type"=>nil, "fi"=>nil}, 
                                                                    {"id"=>4372078, "name"=>"Preferred Plus Card", "balance"=>"769.88", "reference_id"=>"10984092", "aggregation_type"=>"partner", "state"=>"active", "harvest_updated_at"=>nil, "account_type"=>nil, "fi"=>nil}] 
    end

  end

  context "transactions for accounts" do
    it "returns an array of transactions and the pagination info" do
      GeezeoApi.new(AppConfig[:api_key]).transactions_for_user_account(stub(:id => "nakort"), stub(:id => 4372076)).should == [[{"id"=>"006c1c84-d919-4654-ae6e-5b34289e2f6a", "reference_id"=>nil, "transaction_type"=>"Debit", "memo"=>"GameStop", "balance"=>59.99, "posted_at"=>"2013-06-19T00:00:00+00:00", "created_at"=>"2013-06-19T15:53:13+00:00", "nickname"=>"GameStop", "original_name"=>"GameStop", "check_number"=>nil, "tags"=>[{"tag"=>{"name"=>"Entertainment", "balance"=>59.99}}]}, 
                                                                                                       {"id"=>"713728fe-2f27-4b5f-8b1d-5099431fbdcc", "reference_id"=>nil, "transaction_type"=>"Debit", "memo"=>"Check #125", "balance"=>200.0, "posted_at"=>"2013-06-18T00:00:00+00:00", "created_at"=>"2013-06-19T15:53:17+00:00", "nickname"=>"Check #125", "original_name"=>"Check #125", "check_number"=>nil, "tags"=>[{"tag"=>{"name"=>"Personal", "balance"=>200.0}}]}, 
                                                                                                       {"id"=>"51d77668-0619-48dc-b99c-16578df612b3", "reference_id"=>nil, "transaction_type"=>"Credit", "memo"=>"Company Payroll", "balance"=>2809.85, "posted_at"=>"2013-06-17T00:00:00+00:00", "created_at"=>"2013-06-19T15:53:19+00:00", "nickname"=>"Company Payroll", "original_name"=>"Company Payroll", "check_number"=>nil, "tags"=>[{"tag"=>{"name"=>"Income", "balance"=>2809.85}}]}, 
                                                                                                       {"id"=>"ecb3ad20-9992-4dac-a646-798cdb494671", "reference_id"=>nil, "transaction_type"=>"Debit", "memo"=>"California Pizza Kitchen", "balance"=>35.45, "posted_at"=>"2013-06-14T00:00:00+00:00", "created_at"=>"2013-06-19T15:53:23+00:00", "nickname"=>"California Pizza Kitchen", "original_name"=>"California Pizza Kitchen", "check_number"=>nil, "tags"=>[{"tag"=>{"name"=>"Diningout", "balance"=>35.45}}]}, 
                                                                                                       {"id"=>"b95f99f1-5410-49bf-8451-dce7cef62dd8", "reference_id"=>nil, "transaction_type"=>"Debit", "memo"=>"Progressive Insurance", "balance"=>160.48, "posted_at"=>"2013-06-11T00:00:00+00:00", "created_at"=>"2013-06-19T15:53:26+00:00", "nickname"=>"Progressive Insurance", "original_name"=>"Progressive Insurance", "check_number"=>nil, "tags"=>[{"tag"=>{"name"=>"Utilities", "balance"=>160.48}}]},
                                                                                                       {"id"=>"9def2513-3e79-4422-8942-7506be6cef0b", "reference_id"=>nil, "transaction_type"=>"Debit", "memo"=>"Dicks Sporting Goods", "balance"=>45.63, "posted_at"=>"2013-06-09T00:00:00+00:00", "created_at"=>"2013-06-19T15:53:30+00:00", "nickname"=>"Dicks Sporting Goods", "original_name"=>"Dicks Sporting Goods", "check_number"=>nil, "tags"=>[{"tag"=>{"name"=>"Personal", "balance"=>45.63}}]}], {"total_pages"=>6, "current_page"=>1}]
    end

  end
end
