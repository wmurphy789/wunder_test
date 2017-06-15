class ContestsController < ApplicationController

  def index
    @contests = Contest.all.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @contest = Contest.new
    @contest_types = ContestType.all

    @pets = Contest.get_pets
  end

  def create
    @contest = Contest.new(contest_params)

    respond_to do |format|
      if @contest.save
        CreateContestJob.perform_async(@contest.id)
      else
        @contest.errors.add("Error", "Please try completeing again")
      end

      format.js
    end
  end

  private

  def contest_params
    params.require(:contest).permit(:away_contestant, :away_strength, :away_intelligence, :home_contestant, :home_strength, :home_intelligence, :contest_type_id)
  end
end