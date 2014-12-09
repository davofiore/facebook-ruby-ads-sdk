require 'helper'

describe FacebookAds::Object::AdAccount do


  #initialize method
	describe '.initialize' do 
 		
 		it "takes two parameters and returns an AdAccount object" do
 		@account = FacebookAds::Object::AdAccount.new("ID", :client => FacebookAds::Client.new(test_facebook_token))
       	expect(@account).to be_a(FacebookAds::Object::AdAccount)

   		 end


    it "correctly instance the ad_account parameter" do
      @account_id ="ID"
      @account = FacebookAds::Object::AdAccount.new(@account_id, :client => FacebookAds::Client.new(test_facebook_token))
 
      expect(@account.account_id).to be_equal "ID"
      #it doesn't work, expected `"ID".equal?("ID")` to return true, got false
      #Maybe @account is an AdAccount object type and not a String?
    end

     it "successfull found client" do #method find not yet implemented, it's usefull?
      @account_id ="ID"
      @account = FacebookAds::Object::AdAccount.new(@account_id, :client => FacebookAds::Client.new(test_facebook_token))

      expect(@account.find("ID")).to be_true
    end

	 end #end inizialize methods

  describe '.raw_data', vcr: { cassette_name: :ad_accounts } do

    let(:client)   { FacebookAds::Client.new(test_facebook_token) }
    subject(:data) { FacebookAds::Object::AdAccount.raw_data(client) }

    it 'shoul be an array' do
      is_expected.to be_kind_of Array
    end
  end # end describe method .raw_data

  describe '.all', vcr: { cassette_name: :ad_accounts } do

  	let(:client)   { FacebookAds::Client.new(test_facebook_token) }
    subject(:data) { FacebookAds::Object::AdAccount.all(client) }

    it 'shoul be an Array' do
      is_expected.to be_kind_of Array
    end
  end #end describe method .all

  
  describe '.read' do

  end #end describe method .read

end #end describe class AdAccount
