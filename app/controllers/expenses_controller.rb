class ExpensesController < ApplicationController
  before_action :set_job_order, only: [:new, :edit, :update]
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  # def index
  #   @expenses = Expense.all
  # end

  # GET /expenses/1
  # GET /expenses/1.json
  # def show
  # end

  # GET /expenses/new
  def new
    @expense = Expense.find_or_create_by(job_order_id: params[:job_order_id])
    @default_categories = ExpenseCategory.defaults
    @expense_line_items = @expense.build_expense_line_items
  end

  # GET /expenses/1/edit
  def edit
    @default_categories = ExpenseCategory.defaults
    @expense_line_items = @expense.build_expense_line_items
  end

  # POST /expenses
  # POST /expenses.json
  # def create
    # @expense = Expense.new(expense_params)

    # respond_to do |format|
    #   if @expense.save
    #     format.html { redirect_to @job_order, notice: 'Expense was successfully created.' }
    #     format.json { render :show, status: :created, location: @expense }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @expense.errors, status: :unprocessable_entity }
    #   end
    # end
  # end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @job_order, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(
        :job_order_id,
        expense_line_items_attributes: ExpenseLineItem::ACCESSIBLE_ATTRIBUTES)
    end
end
