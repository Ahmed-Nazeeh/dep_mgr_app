class HomeController < ApplicationController
  def index
    
    def search 
    
      render json: params[:order]
      # byebug
      # if params[:order].present?
      #   @orders_search_res = Order.search(params[:order])
  
      #   #byebug
      #   if @orders_search_res
      #       respond_to do |format|
      #         format.js {render partial: 'orders/search_result'}
      #       end
      #   else
      #       respond_to do |format|
      #         flash.now[:alert] = "Couldn`t find work order"
      #         format.js {render partial: 'orders/search_result'}
      #       end
      #   end
      # else
      #       respond_to do |format|
      #           flash.now[:alert] = "Please enter order, name , email to search"
      #           format.js {render partial: 'orders/search_result'}
      #       end
      # end
    end
  end
end
