require 'spec_helper'
describe User do
  
  let(:user){ User.new}
  it "has an id" do
    user.id.should == "nakort"
  end

end
