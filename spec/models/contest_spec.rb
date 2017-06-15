require 'rails_helper'

RSpec.describe Contest, type: :model do
	before :each do

	end

	context 'associations' do
		it { should belong_to :contest_type}
	end

	context 'validations' do
		it { should validate_presence_of :contest_type_id}
		it { should validate_presence_of :away_contestant}
		it { should validate_presence_of :home_contestant}
		it { should validate_presence_of :away_strength}
		it { should validate_presence_of :home_strength}
		it { should validate_presence_of :away_intelligence}
		it { should validate_presence_of :home_intelligence}
	end

	context 'self.get_pets' do
		it 'expect an object' do
			expect(Contest.get_pets).to be_an(Array)
		end
	end

	context 'strength_test' do
		it 'away should win' do
			contest = Contest.new(:away_contestant => "test", :away_strength => 14, :away_intelligence => 12, :home_contestant => "testing", :home_strength => 13, :home_intelligence => 12, :contest_type_id => 1)
			contest.save
			contest.strength_test

			expect(contest.winner).to eq("test")
			expect(contest.status).to eq("finished")
		end

		it 'home should win' do
			contest = Contest.new(:away_contestant => "test", :away_strength => 12, :away_intelligence => 12, :home_contestant => "testing", :home_strength => 13, :home_intelligence => 12, :contest_type_id => 1)
			contest.save
			contest.strength_test
			
			expect(contest.winner).to eq("testing")
			expect(contest.status).to eq("finished")
		end
	end

	context 'intelligence_test' do
		it 'away should win' do
			contest = Contest.new(:away_contestant => "test", :away_strength => 14, :away_intelligence => 12, :home_contestant => "testing", :home_strength => 13, :home_intelligence => 1, :contest_type_id => 1)
			contest.save
			contest.intelligence_test

			expect(contest.winner).to eq("test")
			expect(contest.status).to eq("finished")
		end

		it 'home should win' do
			contest = Contest.new(:away_contestant => "test", :away_strength => 14, :away_intelligence => 12, :home_contestant => "testing", :home_strength => 13, :home_intelligence => 15, :contest_type_id => 1)
			contest.save
			contest.intelligence_test

			expect(contest.winner).to eq("testing")
			expect(contest.status).to eq("finished")
		end
	end

	context 'tie_breaker' do
		it 'away should win' do
			contest = Contest.new(:away_contestant => "test", :away_strength => 14, :away_intelligence => 12, :home_contestant => "testing", :home_strength => 13, :home_intelligence => 1, :contest_type_id => 1)
			contest.save
			contest.tie_breaker

			expect(contest.winner).not_to be_nil
			expect(contest.status).to eq("finished")
		end
	end
	
end