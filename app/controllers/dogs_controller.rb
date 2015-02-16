class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.all
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  def mydogs
    @mydogs = current_user.dogs
  end

  def tomatch
    @user = current_user
    @mydog = Dog.find(params[:id])
    @mydogs = current_user.dogs
    @otherdog = Dog.where.not(sex: @mydog.sex).where(breed: @mydog.breed).where.not(user: @mydog.user).first
    if @user != @mydog.user
      redirect_to mydogs_path, notice: "No eres dueño del perro para hacer esta acción. Elige uno de los que te pertenecen."
    end
  end


  def yesmatch
    @mydog = Dog.find(params[:mydog_id])
    @otherdog = Dog.find(params[:otherdog_id])
    @mydog.interactions.create(otherdog_id: @otherdog.id, like:1)
    redirect_to tomatch_path(@mydog)
  end

   def notmatch
    @mydog = Dog.find(params[:mydog_id])
    @otherdog = Dog.find(params[:otherdog_id])
    @mydog.interaction.create(otherdog_id: @otherdog.id, like:0)
    redirect_to tomatch_path(@mydog)
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(dog_params)
    @dog.user_id = current_user.id

    respond_to do |format|
      if @dog.save
        format.html { redirect_to  mydogs_path, notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to mydogs_path, notice: 'Dog was successfully updated.' }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_url, notice: 'Dog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:name, :breed_id, :age_id, :size, :sex, :description, :city_id, :commune, :photo, :nextperiod, :user_id)
    end
end
