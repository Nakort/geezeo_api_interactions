describe Account do

  context "new" do
    it "initializes correctly from a hash" do
      attr = {"id"=>4372077,"name"=>"Complete Savings", "balance"=>"1000.0", "reference_id"=>"278914032", "aggregation_type"=>"partner", "state"=>"active", "harvest_updated_at"=>nil, "account_type"=>nil, "fi"=>nil} 
      account = Account.new(attr)
      account.id.should == attr["id"]
    end
    it "casts balance into a float" do
      attr = {"id"=>4372077,"name"=>"Complete Savings", "balance"=>"1000.0", "reference_id"=>"278914032", "aggregation_type"=>"partner", "state"=>"active", "harvest_updated_at"=>nil, "account_type"=>nil, "fi"=>nil} 
      account = Account.new(attr)
      account.balance.should == 1000.0
    end
  end

  context "transactions" do
    let(:attr){ {"id"=>4372077, "user" => User.new,"name"=>"Complete Savings", "balance"=>"1000.0", "reference_id"=>"278914032", "aggregation_type"=>"partner", "state"=>"active", "harvest_updated_at"=>nil, "account_type"=>nil, "fi"=>nil}}
    let(:account) { Account.new(attr) }

    it "has transactions" do
      account.transactions.count.should == 6
    end

    it "has pagination information" do
      account.transactions.current_page == 1
      account.transactions.total_pages.should == 6
    end

    it "handles pagination" do
      account.transactions(2).count.should == 7 
    end

    it "can return all transactions without pagination" do
      account.all_transactions.count.should == 34
    end
  end 

end
