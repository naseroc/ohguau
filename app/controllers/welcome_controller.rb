class WelcomeController < ApplicationController
  def index
  	if user_signed_in? == true
  		redirect_to mydogs_path
  	end
  end
end
