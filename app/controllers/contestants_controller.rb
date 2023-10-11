class ContestantsController < ApplicationController
  # hard-coded for now
  GOLDEN_BACHELOR_SEASON_ID = 1

  def index
    @contestants = Contestant.where(season_id: GOLDEN_BACHELOR_SEASON_ID)
  end
end
