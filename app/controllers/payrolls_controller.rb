class PayrollsController < AdminController

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
    if @payroll.save && @payroll.parse
      redirect_to payroll_path(@payroll), :notice => "Created new payroll for #{@payroll.company}"
    else
      render :action => :new
    end
  end

end