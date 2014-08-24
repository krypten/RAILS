class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create

    @order = Order.new
    @order.quantity = session[:quantity][0].to_i
    @order.total_amount = session[:total_amount]
    @order.payment_success = true
    @order.mode_of_collection = "Courier"
    @order.Courier_id = session[:courier_id].to_i
    @order.BillingInfo_id = session[:billing_info_id]
    @order.User_id = session[:user_id]
    ord_id = 0;

    @tickets = Ticket.where(:Order_id => nil).limit(10)
    puts(@tickets.first)
    #respond_to do |format|
      if @order.save
        ord_id = @order.id
        puts("Success" + ord_id.to_s)
      else 
        puts("ERROR")
      end
      @tickets.each do |t|
        v = t.Viewing_id.to_i
        s = t.show_date
        if t.update(:Viewing_id => v, :show_date => s, :Order_id => ord_id)
          puts(t.Order_id)
        end
      end
      #Notifier.received(@order).deliver
      #Notifier.shipped(@order).deliver
      redirect_to root_url, notice: 'Thank You for your Order.'
        #format.json { render action: 'show', status: :created, location: @order }
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:quantity, :total_amount, :payment_success, :mode_of_collection, :Courier_id, :BillingInfo_id, :User_id)
    end
end
