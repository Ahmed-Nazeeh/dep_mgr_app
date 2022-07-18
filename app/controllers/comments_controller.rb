class CommentsController < ApplicationController
  def new
    # @order = Order.find(params[:comment][:commentable_id])
    @comment = Comment.new
  end
  
  def create
    @order = Order.find(params[:comment][:commentable_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id 
    @comment.commentable_type = "Order"
    respond_to do |format|
      if @comment.save
        format.html { redirect_to order_path(@order), notice: "Comment was successfully created." }
        format.json { head :no_content }
      
      else
        flash.now[:alert] = "Something Wrong"
        render order_path(@order) 
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
    @order = Order.find(params[:comment][:commentable_id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to order_path(@order), notice: "Comment has been updated" }
      else
        format.html { redirect_to edit_comment_path(@comment), alert: "Somthing Wrong. with your comment" }
      end
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :commentable_id)
  end
  
end
