require 'spec_helper'

describe AccountsController do

  before do
    @user = User.new
    controller.stub(:current_user).and_return(@user)
  end

  context "show" do
    before :each do
      @account = @user.accounts.first
    end

    it "doesn't assign the requested account to @accounts" do
      get :show, id: @account.id
      assigns(:accounts).should_not include(@account)
    end

    it "assigns the requested account to @account" do
      get :show, id: @account.id
      assigns(:account).should == @account
    end

    it "renders the :show template" do
      get :show, id: @account.id
      response.should render_template(:show)
    end

  end

  context "index" do

    it "populates an array of accounts" do
      get :index
      assigns(:accounts).should == @user.accounts
    end

    it "renders the index view" do
      get :index
      response.should render_template(:index)
    end

  end

end
