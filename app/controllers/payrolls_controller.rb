class PayrollsController < ApplicationController

  def index
    @payrolls = Payroll.all
  end

  def show
    @payroll = Payroll.find(params[:id])
  end

  def new
    @payroll = Payroll.new
  end

  def create
    @payroll = Payroll.new(params[:payroll])
    if @payroll.save
      redirect_to payroll_path(@payroll), :notice => "Created new payroll for Zutphen Construction"
    else
      render :action => :new
    end
  end

end