class WelcomeController < ApplicationController
  skip_before_action :authorize, only: %i[index]

  def index
    if session[:token]
      redirect_to dashboard_path
    end
  end
end
