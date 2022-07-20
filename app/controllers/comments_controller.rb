class CommentsController < ApplicationController
  def new
    @order = Order.find(params[:comment][:commentable_id])
    @comment = Comment.new
    byebug
  end
  
  def create
    @order = Order.find(params[:order_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id unless @comment.user_id
    @comment.commentable_type = "Order"
    @comment.commentable_id = @order.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to order_path(@order), notice: "Comment has been updated" }
      else
        format.html { redirect_to edit_comment_path(@comment), alert: "Somthing Wrong. with your comment" }
      end
    end
  end

  def edit
    @order = Order.find(params[:order_id])
    @comment = Comment.find(params[:id])
  end

  def update
    #we need to add require same user here
    @comment = Comment.find(params[:id])
    @order = Order.find(params[:order_id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to order_path(@order), notice: "Comment has been updated" }
      else
        format.html { redirect_to edit_comment_path(@comment), alert: "Somthing Wrong. with your comment" }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @order = Order.find(params[:order_id])
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to order_path(@order), alert: "Your message has been deleted" } 
      end
  end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
  
end
