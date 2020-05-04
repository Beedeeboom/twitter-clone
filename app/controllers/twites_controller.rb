class TwitesController < ApplicationController
  before_action :set_twite, only: [:show, :edit, :update, :destroy]
  before_action :check_for_image_or_body, only: [:update, :create]

  def check_for_image_or_body
    if params[:twite][:body] == "" and params[:twite][:twite_picture] == nil
      render plain: "Rendering something here"
    end
  end

  def index
    @twites = Twite.all
  end

  def show
  end

  def new
    @twite = Twite.new
  end

  def edit
    if @twite.user_id != current_user.id
      redirect_to root_path, notice: "Unauthorised"
    end
  end

  def create
    @twite = Twite.new(twite_params)
    @twite.user_id = current_user.id
    @twite.twite_pictures.attach(params[:twite][:twite_pictures])
    
    respond_to do |format|
      if @twite.save
        format.html { redirect_to @twite, notice: 'Twite was successfully created.' }
        format.json { render :show, status: :created, location: @twite }
      else
        format.html { render :new }
        format.json { render json: @twite.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @twite.twite_pictures.attach(params[:twite][:twite_pictures])
    respond_to do |format|
      if @twite.update(twite_params)
        format.html { redirect_to @twite, notice: 'Twite was successfully updated.' }
        format.json { render :show, status: :ok, location: @twite }
      else
        format.html { render :edit }
        format.json { render json: @twite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @twite.destroy
    respond_to do |format|
      format.html { redirect_to twites_url, notice: 'Twite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twite
      @twite = Twite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def twite_params
      params.require(:twite).permit(:body)
    end
end