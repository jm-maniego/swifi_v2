class LiquidationsController < ApplicationController
  before_action :set_job_order, only: [:new, :create, :edit, :index, :destroy]
  before_action :set_expense, only: [:new, :create, :edit, :index, :destroy]
  before_action :set_liquidation, only: [:show, :edit, :update, :destroy]

  # GET /liquidations
  # GET /liquidations.json
  def index
    @liquidations = @expense.liquidations.where(id: params[:lq_ids])
  end

  # GET /liquidations/1
  # GET /liquidations/1.json
  def show
  end

  # GET /liquidations/new
  def new
    @liquidation = @expense.liquidations.build
    @liquidation_categories = LiquidationCategory.all
    @import_liquidation_line_items = @liquidation.build_import_liquidation_line_items
    @export_liquidation_line_items = @liquidation.build_export_liquidation_line_items
    # Other should be dynamically addded via js
    @other_liquidation_line_items = [@liquidation.other_liquidation_line_items.build]
  end

  # GET /liquidations/1/edit
  def edit
    @liquidation_categories = LiquidationCategory.all
    @import_liquidation_line_items = @liquidation.import_liquidation_line_items
    @export_liquidation_line_items = @liquidation.export_liquidation_line_items
    # Other should be dynamically addded via js
    @other_liquidation_line_items = [@liquidation.other_liquidation_line_items.build]
  end

  # POST /liquidations
  # POST /liquidations.json
  def create
    @liquidation = @expense.liquidations.build(liquidation_params)

    respond_to do |format|
      if @liquidation.save
        format.html { redirect_to @job_order, notice: 'Liquidation was successfully created.' }
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
      format.html { redirect_to job_order_expense_liquidations_url(@job_order, @expense), notice: 'Liquidation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_order
      @job_order = JobOrder.find(params[:job_order_id])
    end

    def set_expense
      @expense = @job_order.expense
    end

    def set_liquidation
      @liquidation = @expense.liquidations.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liquidation_params
      params.require(:liquidation).permit(
        :liquidated_by_name,
        import_liquidation_line_items_attributes: LiquidationLineItem::ACCESSIBLE_ATTRIBUTES,
        export_liquidation_line_items_attributes: LiquidationLineItem::ACCESSIBLE_ATTRIBUTES,
        other_liquidation_line_items_attributes: LiquidationLineItem::ACCESSIBLE_ATTRIBUTES
        )
    end
end
