class WelcomeController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper

  def index
    #if logged_in?
     # redirect_to home_url
   # end
  end

  
  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
