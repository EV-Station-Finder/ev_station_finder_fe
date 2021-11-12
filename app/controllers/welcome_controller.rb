class WelcomeController < ApplicationController
  def index
    if session[:token]
      redirect_to dashboard_path
    end
  end
end
