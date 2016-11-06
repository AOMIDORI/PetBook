class WelcomeController < ApplicationController
  protect_from_forgery with: :exception
  def index
  end
  include SessionsHelper
end
