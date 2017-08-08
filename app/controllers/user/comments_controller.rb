class User::CommentsController < ApplicationController

  before_action :set_company
  before_action :set_post, except: [:show_all_comments]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @comment.user = @post.user
    if params.require(:user_comment).permit(:parent_comment).present?
      @comment.parent_comment_id = params.require(:user_comment).require(:parent_comment)
    else
    end
    if @comment.save
      flash.now[:notice] = 'Comment Created'
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash.now[:notice] = 'Comment Updated'
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
    end
    render partial: 'all_comments'
  end

  def destroy
    if @comment.destroy
      flash.now[:notice] = 'Comment Destroyed'
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
    end
  end

  def show_all_comments
    if (Company::Post.find(params[:liked_item]).present? rescue nil)
      @post_item = Company::Post.find(params[:liked_item])
    else
      @comment_item = User::Comment.find(params[:liked_item])
    end
  end

  private

  def comment_params
    params.require(:user_comment).permit(:description)
  end

  def set_post
    @post = Company::Post.find(params[:post_id])
  end

  def set_params
    @comment = @employee.comments.find(params[:id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

end
