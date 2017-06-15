class ContestType < ActiveRecord::Base
	has_many :contests

	def is_strength_test?
		name == "Strength Test"
    end

    def is_intelligence_test?
    	name == "Intelligence Test"
    end
end