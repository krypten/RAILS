class AudiInfosController < ApplicationController
  before_action :set_audi_info, only: [:show, :edit, :update, :destroy]

  # GET /audi_infos
  # GET /audi_infos.json
  def index
    @audi_infos = AudiInfo.all
  end

  # GET /audi_infos/1
  # GET /audi_infos/1.json
  def show
  end

  # GET /audi_infos/new
  def new
    @audi_info = AudiInfo.new
  end

  # GET /audi_infos/1/edit
  def edit
  end

  # POST /audi_infos
  # POST /audi_infos.json
  def create
    @audi_info = AudiInfo.new(audi_info_params)

    respond_to do |format|
      if @audi_info.save
        format.html { redirect_to @audi_info, notice: 'Audi info was successfully created.' }
        format.json { render action: 'show', status: :created, location: @audi_info }
      else
        format.html { render action: 'new' }
        format.json { render json: @audi_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audi_infos/1
  # PATCH/PUT /audi_infos/1.json
  def update
    respond_to do |format|
      if @audi_info.update(audi_info_params)
        format.html { redirect_to @audi_info, notice: 'Audi info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @audi_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audi_infos/1
  # DELETE /audi_infos/1.json
  def destroy
    @audi_info.destroy
    respond_to do |format|
      format.html { redirect_to audi_infos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audi_info
      @audi_info = AudiInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audi_info_params
      params.require(:audi_info).permit(:screen_no, :seat_no, :Pricing_id)
    end
end
