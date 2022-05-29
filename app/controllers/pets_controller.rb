class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]

  # GET /pets or /pets.json
  def index
    @client = Client.find(params[:client_id])
    @pets = @client.pets
  end

  # GET /pets/1 or /pets/1.json
  def show
    @pet = Pet.find(params[:id])
  end

  # GET /pets/new
  def new
    #@pet = Pet.new
    #@clients = Client.all
    @client = Client.find(params[:client_id])
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
    @client = Client.find(params[:client_id])
    @pet = Pet.find(params[:id])
  end

  # POST /pets or /pets.json
  def create
    @client = Client.find(params[:client_id])
    @pet = Pet.new(pet_params)
    @pet.client = @client

    respond_to do |format|
      if @pet.save
        format.html { redirect_to client_pet_url(@client, @pet), notice: "Mascota Creada!" }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    @client = Client.find(params[:client_id])
    @pet = Pet.find(params[:id])
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to client_pet_url(@pet), notice: "Registro Actualizado!." }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to client_pets_url, notice: "Registro Eliminado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:name, :race, :birthday, :client_id)
    end
end
