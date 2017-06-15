class CreateContestJob
  include Sidekiq::Worker

  def perform(contest_id)
    # Do something later
    contest = Contest.find_by(id: contest_id)
    if contest
	    if contest.winner.nil?
	    	if contest.contest_type.is_strength_test?
	    		contest.strength_test
	    	elsif contest.contest_type.is_intelligence_test?
	    		contest.intelligence_test
	    	end
	    end
	end
  end
end
