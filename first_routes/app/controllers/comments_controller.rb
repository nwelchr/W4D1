class CommentsController < ApplicationController

  def index
    # debugger
    if params[:user_id]
      comments = User.find(params[:user_id]).comments
    elsif params[:artwork_id]
      comments = Artwork.find(params[:artwork_id]).comments
    end
    render json: comments
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    comment = Comment.find(params[:id])
    if comment
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update_attributes(comment_params)
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    #your code here...
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end


  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id)
  end


end
