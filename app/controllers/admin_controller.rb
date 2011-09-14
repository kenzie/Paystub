class AdminController < ApplicationController

  before_filter :admin_required

  def welcome
    
  end

end