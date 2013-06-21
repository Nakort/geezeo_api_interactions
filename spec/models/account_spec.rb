require "spec_helper"

describe Account do

  it "initializes correctly from a hash" do
    attr = {"id"=>4372077,"name"=>"Complete Savings", "balance"=>"1000.0", "reference_id"=>"278914032", "aggregation_type"=>"partner", "state"=>"active", "harvest_updated_at"=>nil, "account_type"=>nil, "fi"=>nil} 
    account = Account.new(attr)
    account.id.should == attr["id"]
  end

  it "has transactions" do
    attr = {"id"=>4372077,"name"=>"Complete Savings", "balance"=>"1000.0", "reference_id"=>"278914032", "aggregation_type"=>"partner", "state"=>"active", "harvest_updated_at"=>nil, "account_type"=>nil, "fi"=>nil} 
    attr["user"] = User.new
    account = Account.new(attr)
    account.transactions.count.should == 6
  end

end
