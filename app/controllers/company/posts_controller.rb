class Company::PostsController < ApplicationController

  before_action :set_company
  before_action :set_team
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.team = @team
    @post.for_team = true
    if @post.save
      flash.now[:notice] = 'Post Created'
    else
      flash.now[:alert] = @post.errors.full_messages.join(', ')
    end
  end

  def destroy
    if @post.destroy
      flash.now[:notice] = 'Post Destroyed'
    else
      flash.now[:alert] = @post.errors.full_messages.join(', ')
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash.now[:notice] = 'Post Updated'
      flash.now[:alert] = @post.errors.full_messages.join(', ')
    end
    render partial: 'all_posts'
  end

  private

  def post_params
    params.require(:company_post).permit(:description, :receiver_id)
  end

  def set_post
    @post = @team.posts.find(params[:id])
  end

  def set_team
    @team = Company::Team.find(params[:team_id])
  end

end