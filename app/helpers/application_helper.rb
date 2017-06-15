module ApplicationHelper
	def get_contests
		ContestType.all
	end
end
