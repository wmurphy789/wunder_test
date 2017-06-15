require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  
	context 'get_contests' do 
		it 'should return 2' do
			expect(helper.get_contests).to be_an(Object)
		end
	end
end