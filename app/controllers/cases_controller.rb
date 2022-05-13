require 'date'

class CasesController < ApplicationController
  before_action :set_case, only: %i[ show update destroy ]

  def index
    render json: { challenge: 'Backend Challenge - Covid Daily Cases' }, status: 200
  end

  def get_count
   if params[:getdate] =~ /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/
    @cases = Case.get_by_date(params[:getdate])
    @sort_by = @cases.group_by { |c| c["location"] }
    # @sort_by_country.sort_by { |k, _| k["variant"] }
    render json: @sort_by
   else
    render json: { invalid: 'Date format expected is: yyyy-mm-dd' }, status: 200 
   end
  end

  def get_dates 
    render json: Case.get_all_dates
  end

  def get_cumulative
    if params[:getdate] =~ /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/
      @cases = Case.get_by_date(params[:getdate])
      @cumulative = @cases.count
      @sort_by = @cases.group_by { |c| c["location"] }
      @hash_with_cumulative = {cumulative: @cumulative}.merge(@sort_by)
      render json: @hash_with_cumulative
    else
      render json: { invalid: 'Date format expected is: yyyy-mm-dd' }, status: 200 
    end
  end

  def not_found
    render json: { invalid: 'Invalid request' }, status: 404
  end
end
