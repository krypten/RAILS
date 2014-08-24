class BillingInfosController < ApplicationController
  before_action :set_billing_info, only: [:show, :edit, :update, :destroy]

  # GET /billing_infos
  # GET /billing_infos.json
  def index
    @billing_infos = BillingInfo.all
  end

  # GET /billing_infos/1
  # GET /billing_infos/1.json
  def show
  end

  # GET /billing_infos/new
  def new
    @billing_info = BillingInfo.new
  end

  # GET /billing_infos/1/edit
  def edit
  end

  # POST /billing_infos
  # POST /billing_infos.json
  def create
    @billing_info = BillingInfo.new(bill_date: Date.today, CardInfo_id: session[:card_info_id])
    #respond_to do |format|
      if @billing_info.save
        session[:billing_info_id] = @billing_info.id 
      end
      if params[:mode_of_collection][0].to_s ==  "Courier"
        redirect_to new_courier_path, notice: 'Billing info was successfully created.' 
        #format.json { render action: 'show', status: :created, location: @billing_info }
      else
        session[:courier_id] = nil
        redirect_to new_order_path, notice: 'Your tickets will be available at Counter.'
        #format.html { render action: 'new' }
        #format.json { render json: @billing_info.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /billing_infos/1
  # PATCH/PUT /billing_infos/1.json
  def update
    respond_to do |format|
      if @billing_info.update(billing_info_params)
        format.html { redirect_to @billing_info, notice: 'Billing info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @billing_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billing_infos/1
  # DELETE /billing_infos/1.json
  def destroy
    @billing_info.destroy
    respond_to do |format|
      format.html { redirect_to billing_infos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing_info
      @billing_info = BillingInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billing_info_params
      params.require(:billing_info).permit(:bill_date, :CardInfo_id)
    end
end
