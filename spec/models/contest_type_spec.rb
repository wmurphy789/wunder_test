require 'rails_helper'

RSpec.describe ContestType, type: :model do
	before :each do
		@strength_contest = ContestType.new(name: "Strength Test")
		@strength_contest.save

		@intelligence_contest = ContestType.new(name: "Intelligence Test")
		@intelligence_contest.save
	end

	context 'associations' do
		it { should have_many :contests}
	end

	context 'is_strength_test?' do
		it 'should return true' do
			expect(@strength_contest.is_strength_test?).to be_truthy
		end

		it 'should return false' do
			expect(@intelligence_contest.is_strength_test?).to be_falsey
		end
	end

	context 'is_intelligence_test?' do
		it 'should return false' do
			expect(@strength_contest.is_intelligence_test?).to be_falsey
		end

		it 'should return true' do
			expect(@intelligence_contest.is_intelligence_test?).to be_truthy
		end
	end
end