class LiquidationFormLinesController < ApplicationController
  before_action :set_liquidation_form_line, only: [:show, :edit, :update, :destroy]

  # GET /liquidation_form_lines
  # GET /liquidation_form_lines.json
  def index
    @liquidation_form_lines = LiquidationFormLine.all
  end

  # GET /liquidation_form_lines/1
  # GET /liquidation_form_lines/1.json
  def show
  end

  # GET /liquidation_form_lines/new
  def new
    @liquidation_form_line = LiquidationFormLine.new
  end

  # GET /liquidation_form_lines/1/edit
  def edit
  end

  # POST /liquidation_form_lines
  # POST /liquidation_form_lines.json
  def create
    @liquidation_form_line = LiquidationFormLine.new(liquidation_form_line_params)

    respond_to do |format|
      if @liquidation_form_line.save
        format.html { redirect_to @liquidation_form_line, notice: 'Liquidation form line was successfully created.' }
        format.json { render :show, status: :created, location: @liquidation_form_line }
      else
        format.html { render :new }
        format.json { render json: @liquidation_form_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liquidation_form_lines/1
  # PATCH/PUT /liquidation_form_lines/1.json
  def update
    respond_to do |format|
      if @liquidation_form_line.update(liquidation_form_line_params)
        format.html { redirect_to @liquidation_form_line, notice: 'Liquidation form line was successfully updated.' }
        format.json { render :show, status: :ok, location: @liquidation_form_line }
      else
        format.html { render :edit }
        format.json { render json: @liquidation_form_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liquidation_form_lines/1
  # DELETE /liquidation_form_lines/1.json
  def destroy
    @liquidation_form_line.destroy
    respond_to do |format|
      format.html { redirect_to liquidation_form_lines_url, notice: 'Liquidation form line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liquidation_form_line
      @liquidation_form_line = LiquidationFormLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liquidation_form_line_params
      params.require(:liquidation_form_line).permit(:name)
    end
end
