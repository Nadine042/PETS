class PetsController < ApplicationController

  def show
    @pet = Pet.find(params[:id])
    @user = @pet.user
    @user.geocode
    @marker = [{ lat: @user.latitude, lng: @user.longitude }]
  end

  def index
    @pets = Pet.all
    carousel
    @users = User.joins(:pets)
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params) if @pet.user == current_user
    redirect_to pets_path(@pets)
  end

  def carousel
    @cat_list = []
    @dog_list = []
    @bird_list = []
    @rabbit_list = []
    @pets.each do |pet|
      if pet.kind == "cat"
        @cat_list << pet
      elsif pet.kind == "dog"
        @dog_list << pet
      elsif pet.kind == "bird"
        @bird_list << pet
      elsif pet.kind == "rabbit"
        @rabbit_list << pet
      end
    end
    @pets_array = [@cat_list, @dog_list, @bird_list, @rabbit_list]
  end

  private


  def pet_params
    params.require(:pet).permit(:name, :kind, :age, :details, :user)
  end


end
