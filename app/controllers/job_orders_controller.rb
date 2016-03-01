class JobOrdersController < ApplicationController
  before_action :set_page, only: [:index]
  before_action :init_form, only: [:new, :edit, :create, :update]
  before_action :set_job_order, only: [:show, :edit, :update, :destroy]

  # GET /job_orders
  # GET /job_orders.json
  def index
    @job_orders = JobOrder.includes(:client).order('created_at DESC').paginate(page: @page)
  end

  # GET /job_orders/1
  # GET /job_orders/1.json
  def show
    @expense = @job_order.expense
    if @expense.present?
      @expense_line_items = @expense.build_expense_line_items
    end
  end

  # GET /job_orders/new
  def new
    @job_order = JobOrder.new
    @job_order.set_new_record_default_values
    @job_order.build_client
    @job_order.build_bill
  end

  # GET /job_orders/1/edit
  def edit
  end

  # POST /job_orders
  # POST /job_orders.json
  def create
    @job_order = JobOrder.new(job_order_params)
    binding.pry
    # Hack for accepts_nested_attributes_for :client
    if @job_order.client.present? && @job_order.client.new_record? && @job_order.client.save!
      @job_order.client_id = @job_order.client.id
    end

    respond_to do |format|
      if @job_order.save
        format.html { redirect_to @job_order, notice: 'Job order was successfully created.' }
        format.json { render :show, status: :created, location: @job_order }
      else
        if @job_order.client.blank?
          @job_order.build_client
        end
        format.html { render :new }
        format.json { render json: @job_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_orders/1
  # PATCH/PUT /job_orders/1.json
  def update
    respond_to do |format|
      if @job_order.update(job_order_params)
        format.html { redirect_to @job_order, notice: 'Job order was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_order }
      else
        format.html { render :edit }
        format.json { render json: @job_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_orders/1
  # DELETE /job_orders/1.json
  def destroy
    @job_order.destroy
    respond_to do |format|
      format.html { redirect_to job_orders_url, notice: 'Job order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def init_form
      @mode_of_shipments  = JobOrder.mode_of_shipments
      @service_types      = JobOrder.service_types
      @job_order_services = JobOrder.services
      @clients            = Client.all
    end

    def set_page
      @page = params[:page] || 1
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_job_order
      @job_order = JobOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_order_params
      params.require(:job_order).permit(
        JobOrder::ACCESSIBLE_ATTRIBUTES,
        bill_attributes: Bill::ACCESSIBLE_ATTRIBUTES,
        client_attributes: Client::ACCESSIBLE_ATTRIBUTES
        )
    end
end
