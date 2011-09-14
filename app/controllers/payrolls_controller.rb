class PayrollsController < ApplicationController

  before_filter :admin_required

  def index
    @payrolls = current_user.payrolls.all
  end

  def show
    @payroll = current_user.payrolls.find(params[:id])
  end

  def new
    @payroll = current_user.payrolls.new
  end

  def create
    @payroll = current_user.payrolls.new(params[:payroll])
    if @payroll.save
      redirect_to payroll_path(@payroll), :notice => "Created new payroll for Zutphen Construction"
    else
      render :action => :new
    end
  end

end