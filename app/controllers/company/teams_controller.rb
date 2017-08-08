class Company::TeamsController < ApplicationController

  before_action :set_company
  before_action :set_team, except: [:index]
  
  def index
  end

  def show
  end

  private

  def set_team
    @team = Company::Team.find(params[:team_id] || params[:id])
  end
end