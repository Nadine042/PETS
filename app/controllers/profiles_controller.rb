class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @pets = @user.pets
  end
end
