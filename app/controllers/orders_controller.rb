class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
    
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order_id = get_order_id
  end

  # GET /orders/1/edit
  def edit
      @order_id = @order.order_number
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def select_field_disable_enable
    if current_user.is_admin?
      return :disabled => false 
    else
      return :disabled => true 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:order_number, :title, :description, :recieved, :recieved_by, :approved, :approved_by, :closed, :closed_by, :remarks, :status, :actions)
    end

    def get_order_id  #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< in case of nil it will give error
      @order ? order_id = Order.last.id + 1 : order_id = 1
      year_day = Date.today.yday
      year = Date.today.year
      "WO-#{year_day}-#{order_id}-#{year}"
    end

    
    
  end