class CommentsController < ApplicationController
  before_action :set_order, execpt: %i[new]
  before_action :set_comment, only: %i[edit update destroy]
  before_action :require_comment_user, only: %i[edit destroy]

  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id unless @comment.user_id
    @comment.commentable_type = "Order"
    @comment.commentable_id = @order.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to order_path(@order), notice: "Comment has been Created" }
      else
        format.html { redirect_to order_path(@order), alert: "Somthing Wrong. with your comment" }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to order_path(@order), notice: "Comment has been updated" }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to order_path(@order), alert: "Your message has been deleted" }
      end
    end
  end

  def likes_create
    @order = Order.find(params[:order_id])
    @comment = Comment.find(params[:comment_id])
    @comments = Comment.where(commentable_type: :Order, commentable_id: @order.id).order(:created_at)
    like = @comment.like
      @comment.like = like + 1
    if @comment.save
      respond_to do |format|
        format.js { render partial: 'orders/like' }
      end
    end
  end

  def likes_destroy
    @order = Order.find(params[:order_id])
    @comment = Comment.find(params[:comment_id])
    @comments = Comment.where(commentable_type: :Order, commentable_id: @order.id).order(:created_at)
    like = @comment.like
    if like < 1
      @comment.like = 0
    else
      @comment.like = like - 1
    end
    if @comment.save
      respond_to do |format|
        format.js { render partial: 'orders/like' }
      end
    end
  end

  private
  
  def set_order
    @order = Order.find(params[:order_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def require_comment_user
    unless current_user.id == @comment.user_id.to_i 
      if params[:action] = "destroy"
        redirect_to order_path(@order)
        flash[:alert] = "This is not your comment. You can not perform that action" 
      elsif params[:action] = "edit"
        redirect_to edit_comment_path(@comment)
        flash[:alert] = "This is not your comment. You can not perform that action" 
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
  
end
