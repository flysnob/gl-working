# Responsible for controlling all the reports in the app
class ReportsController < ApplicationController
  before_action :set_date_parameters
  before_action :hydrate_office_if_present

  # This class is just a proxy object that wraps account information so the view does not need to know it is not
  # dealing with Account objects.
  AccountProxyStruct = Struct.new(:name, :code, :asset?, :journal_lines, :start_balance)

  def set_date_parameters
    if params[:start_date]
      @start_date = Date.strptime(params[:start_date], '%m/%d/%Y')
    else
      @start_date ||= Date.today.beginning_of_month
    end
    if params[:end_date]
      @end_date = Date.strptime(params[:end_date], '%m/%d/%Y')
    else
      @end_date ||= Date.today
    end
  end

  def project_report
    @trial_balance = TrialBalanceReport.report(@start_date, @end_date, @office)
  end

  private

  def create_proxy_struct(account, balance)
    AccountProxyStruct.new(
      account.name,
      account.code,
      account.asset?,
      [],
      balance
    )
  end
end
