class TwitesController < ApplicationController
  before_action :set_twite, only: [:show, :edit, :update, :destroy]

  # GET /twites
  # GET /twites.json
  def index
    @twites = Twite.all
  end

  # GET /twites/1
  # GET /twites/1.json
  def show
  end

  # GET /twites/new
  def new
    @twite = Twite.new
  end

  # GET /twites/1/edit
  def edit
  end

  # POST /twites
  # POST /twites.json
  def create
    @twite = Twite.new(twite_params)

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

  # PATCH/PUT /twites/1
  # PATCH/PUT /twites/1.json
  def update
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

  # DELETE /twites/1
  # DELETE /twites/1.json
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
      params.require(:twite).permit(:body, :user_id)
    end
end
