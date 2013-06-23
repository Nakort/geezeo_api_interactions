require "spec_helper"

describe Transaction do

  context "new" do
    it "initializes correctly from a hash" do
      attr = {"id"=>"713728fe-2f27-4b5f-8b1d-5099431fbdcc", "reference_id"=>nil, "transaction_type"=>"Debit", "memo"=>"Check #125", "balance"=>200.0, "posted_at"=>"2013-06-18T00:00:00+00:00", "created_at"=>"2013-06-19T15:53:17+00:00", "nickname"=>"Check #125", "original_name"=>"Check #125", "check_number"=>nil, "tags"=>[{"tag"=>{"name"=>"Personal", "balance"=>200.0}}]}
      transaction = Transaction.new(attr)
      transaction.id.should == attr["id"]
    end
  end

  context "credit?" do
    it "returns true for transactions with type Credit" do
      t = Transaction.new(:transaction_type => "Credit")
      t.credit?.should be_true
    end
    it "returns false for transactions with type Debit" do
      t = Transaction.new(:transaction_type => "Debit")
      t.credit?.should be_false
    end
  end

  context "debit?" do
    it "returns true for transactions with type Debit" do
      t = Transaction.new(:transaction_type => "Debit")
      t.debit?.should be_true
    end
    it "returns false for transactions with type Credit" do
      t = Transaction.new(:transaction_type => "Credit")
      t.debit?.should be_false
    end
  end
end
