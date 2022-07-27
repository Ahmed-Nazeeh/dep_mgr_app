class LikesController < ApplicationController
    before_action :set_order_and_comment, only: %i[new create destroy]
    before_action :set_comments, only: %i[create destroy]
    def new
        @like = Like.new
    end
    def create 
        @like = Like.new(like: true, comment_id: @comment.id, user_id: current_user.id)
        if @like.save 
            respond_to do |format|
                format.js { render partial: 'orders/old_comments' }
            end
        end
    end

    def destroy 
        @like = Like.find(params[:like_id])
        if @like.destroy 
            respond_to do |format|
                format.js { render partial: 'orders/old_comments' }
            end
        end
    end

    private

    def set_order_and_comment
        @order = Order.find(params[:order_id])
        @comment = Comment.find(params[:comment_id])
    end

    def set_comments
        @comments = Comment.where(commentable_type: :Order, commentable_id: @order.id).order(:created_at)
    end
end
