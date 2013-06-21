require "spec_helper"

describe Account do

  context "new" do
    it "initializes correctly from a hash" do
      attr = {"id"=>4372077, "name"=>"Complete Savings", "balance"=>"1000.0", "reference_id"=>"278914032", "aggregation_type"=>"partner", "state"=>"active", "harvest_updated_at"=>nil, "account_type"=>nil, "fi"=>nil} 
      account = Account.new(attr)
      account.id.should == attr["id"]
    end
  end
end
