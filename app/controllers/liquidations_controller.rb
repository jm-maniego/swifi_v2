class LiquidationsController < ApplicationController
  before_action :set_liquidation, only: [:show, :edit, :update, :destroy]

  # GET /liquidations
  # GET /liquidations.json
  def index
    @liquidations = Liquidation.all
  end

  # GET /liquidations/1
  # GET /liquidations/1.json
  def show
  end

  # GET /liquidations/new
  def new
    @liquidation = Liquidation.new
  end

  # GET /liquidations/1/edit
  def edit
  end

  # POST /liquidations
  # POST /liquidations.json
  def create
    @liquidation = Liquidation.new(liquidation_params)

    respond_to do |format|
      if @liquidation.save
        format.html { redirect_to @liquidation, notice: 'Liquidation was successfully created.' }
        format.json { render :show, status: :created, location: @liquidation }
      else
        format.html { render :new }
        format.json { render json: @liquidation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liquidations/1
  # PATCH/PUT /liquidations/1.json
  def update
    respond_to do |format|
      if @liquidation.update(liquidation_params)
        format.html { redirect_to @liquidation, notice: 'Liquidation was successfully updated.' }
        format.json { render :show, status: :ok, location: @liquidation }
      else
        format.html { render :edit }
        format.json { render json: @liquidation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liquidations/1
  # DELETE /liquidations/1.json
  def destroy
    @liquidation.destroy
    respond_to do |format|
      format.html { redirect_to liquidations_url, notice: 'Liquidation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liquidation
      @liquidation = Liquidation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liquidation_params
      params.require(:liquidation).permit(:liquidated_by_name)
    end
end
