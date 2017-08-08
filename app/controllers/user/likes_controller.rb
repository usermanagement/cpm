class User::LikesController < ApplicationController

  before_action :set_company
  before_action :set_liked_item, except: [:show_all_likes]
  before_action :set_like , only: [:destroy]

  def new
  end

  def create
    @like = current_user.likes.new
    @like.post = @post
    @like.comment = @comment
    if current_user.likes.where(post_id: @post.id.to_s).blank?
      @like.save(validate: false)
      render 'like'
    else
      head status: 200
    end
  end

  def destroy
    @like.destroy
    render 'unlike'
  end

  def show_all_likes
    if (Company::Post.find(params[:liked_item]).present? rescue nil)
      @post_item = Company::Post.find(params[:liked_item])
    else
      @comment_item = User::Comment.find(params[:liked_item])
    end
  end

  private

  def set_liked_item
    if (Company::Post.find(params[:format]).present? rescue nil)
      @post = Company::Post.find(params[:format])
    else
      @comment = User::Comment.find(params[:format])
    end
  end

  def set_like
    @like = current_user.likes.find(params[:id])
  end

end
