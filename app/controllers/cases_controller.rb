require 'date'

class CasesController < ApplicationController
  before_action :set_case, only: %i[ show update destroy ]

  # GET /cases
  def index

    render json: "Backend Challenge - Covid Daily Cases"
  end

  # GET /cases/1
  def get_count
    @cases = Case.get_by_date(params[:getdate])
    @sort_by = @cases.group_by { |c| c["location"] }
    # @sort_by_country.sort_by { |k, _| k["variant"] }
    render json: @sort_by
  end

  def get_dates 
    render json: Case.get_all_dates
  end

  def get_cumulative
    @cases = Case.get_by_date(params[:getdate])
    @cumulative = @cases.count
    @sort_by = @cases.group_by { |c| c["location"] }
    @hash_with_cumulative = {cumulative: @cumulative}.merge(@sort_by)
    render json: @hash_with_cumulative
  end


  # POST /cases
  def create
    @case = Case.new(case_params)

    if @case.save
      render json: @case, status: :created, location: @case
    else
      render json: @case.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cases/1
  def update
    if @case.update(case_params)
      render json: @case
    else
      render json: @case.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cases/1
  def destroy
    @case.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case
      @case = Case.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def case_params
      params.require(:case).permit(:location, :date, :variant, :num_sequences, :perc_sequences, :num_sequences_total)
    end
end
