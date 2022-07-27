class HomeController < ApplicationController

  def index
    def search 
      render json: params[:order]
    end
  end
  
end
