class LiquidationCategoriesController < ApplicationController
  before_action :set_liquidation_category, only: [:show, :edit, :update, :destroy]

  # GET /liquidation_categories
  # GET /liquidation_categories.json
  def index
    @liquidation_categories = LiquidationCategory.all
  end

  # GET /liquidation_categories/1
  # GET /liquidation_categories/1.json
  def show
  end

  # GET /liquidation_categories/new
  def new
    @liquidation_category = LiquidationCategory.new
  end

  # GET /liquidation_categories/1/edit
  def edit
  end

  # POST /liquidation_categories
  # POST /liquidation_categories.json
  def create
    @liquidation_category = LiquidationCategory.new(liquidation_category_params)

    respond_to do |format|
      if @liquidation_category.save
        format.html { redirect_to @liquidation_category, notice: 'Liquidation category was successfully created.' }
        format.json { render :show, status: :created, location: @liquidation_category }
      else
        format.html { render :new }
        format.json { render json: @liquidation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liquidation_categories/1
  # PATCH/PUT /liquidation_categories/1.json
  def update
    respond_to do |format|
      if @liquidation_category.update(liquidation_category_params)
        format.html { redirect_to @liquidation_category, notice: 'Liquidation category was successfully updated.' }
        format.json { render :show, status: :ok, location: @liquidation_category }
      else
        format.html { render :edit }
        format.json { render json: @liquidation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liquidation_categories/1
  # DELETE /liquidation_categories/1.json
  def destroy
    @liquidation_category.destroy
    respond_to do |format|
      format.html { redirect_to liquidation_categories_url, notice: 'Liquidation category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liquidation_category
      @liquidation_category = LiquidationCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liquidation_category_params
      params.require(:liquidation_category).permit(:name, :type, :default_flag)
    end
end
