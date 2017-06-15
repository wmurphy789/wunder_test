require 'rails_helper'

RSpec.describe ContestsController, type: :controller do

	before :each do
      
	end

	describe "GET #index" do
		it "returns http success" do
			get :index
	  		expect(response).to have_http_status(:success)
		end

		it "returns 4" do
			(0..3).each do |t|
				contest = Contest.new(:away_contestant => "test", :away_strength => 1, :away_intelligence => 12, :home_contestant => "testing", :home_strength => 13, :home_intelligence => 12, :contest_type_id => 1)
	      		contest.save
			end

			get :index
	  		expect(assigns[:contests].size).to eq(4)
		end

		it "returns 10" do
			(0..12).each do |t|
				contest = Contest.new(:away_contestant => "test", :away_strength => 1, :away_intelligence => 12, :home_contestant => "testing", :home_strength => 13, :home_intelligence => 12, :contest_type_id => 1)
	      		contest.save
			end

			get :index
	  		expect(assigns[:contests].size).to eq(10)
		end
	end

	describe "POST #create" do
		it "increases contest by 1" do
	      expect {
			post :create, contest: {away_contestant: "test", away_strength: 1, away_intelligence: 12, home_contestant: "testing", home_strength: 13, home_intelligence: 12, contest_type_id: 1}, format: :js
		  }.to change(Contest, :count).by(1)
	    end

	    it "increases contest by 0, because missing away_contestant" do
	      expect {
			post :create, contest: { away_strength: 1, away_intelligence: 12, home_contestant: "testing", home_strength: 13, home_intelligence: 12, contest_type_id: 1}, format: :js
		  }.to change(Contest, :count).by(0)
	    end

	    it "increases contest by 0, because missing everything" do
	      expect {
			post :create, contest: { contest_type_id: 1 }, format: :js
		  }.to change(Contest, :count).by(0)
	    end
	end
end