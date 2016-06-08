class ReportsController < ApplicationController
  before_filter :set_current_tab
  
  def index
  end

  def weekly_summary
    if params[:start_date] && params[:end_date]
      @start_date = Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
      @end_date = Date.civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    else
      @start_date =  Date.current - 7.days
      @end_date =  Date.current
    end
    
    @examinations_count = ChiropracticExamination.where(:initial_examination => true, :insurance_claim_filed_at => @start_date..@end_date + 1.day).count
    @re_examinations_count = ChiropracticExamination.where(:initial_examination => false, :insurance_claim_filed_at => @start_date..@end_date + 1.day).count
    @treatments_count = ChiropracticTreatment.where(:insurance_claim_filed_at => @start_date..@end_date).count
  end

  def monthly_summary
    if params[:date] && params[:date][:month] && params[:date][:year]
      @month = params[:date][:month].to_i
      @year = params[:date][:year].to_i
    else
      @month = Date.current.month
      @year = Date.current.year
    end
    
    @start_date = Date.civil(@year, @month, 1)
    @end_date = @start_date.end_of_month
    
    @examinations_count = ChiropracticExamination.where(:initial_examination => true, :insurance_claim_filed_at => @start_date..@end_date + 1.day).count
    @re_examinations_count = ChiropracticExamination.where(:initial_examination => false, :insurance_claim_filed_at => @start_date..@end_date + 1.day).count
    @treatments_count = ChiropracticTreatment.where(:insurance_claim_filed_at => @start_date..@end_date).count
  end

  private
  
  def set_current_tab
    session[:current_tab] = 'Reports'
  end
  
end
