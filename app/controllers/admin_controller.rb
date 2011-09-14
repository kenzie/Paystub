class AdminController < ApplicationController

  before_filter :require_admin

  def welcome
    
  end

end