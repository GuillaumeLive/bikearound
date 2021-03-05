class Account::BikesController < ApplicationController
  def index
    @bikes = current_user.bikes
  end
end
