class PostalCodesController < ApplicationController
  before_action :set_postal_code, only: %i[ show edit update destroy ]

  # GET /postal_codes or /postal_codes.json
  def index
    @postal_codes = PostalCode.all
  end

  # GET /postal_codes/1 or /postal_codes/1.json
  def show
  end

  # GET /postal_codes/new
  def new
    @postal_code = PostalCode.new
  end

  # GET /postal_codes/1/edit
  def edit
  end

  # POST /postal_codes or /postal_codes.json
  def create
    @postal_code = PostalCode.new(postal_code_params)

    respond_to do |format|
      if @postal_code.save
        format.html { redirect_to postal_code_url(@postal_code), notice: "Postal code was successfully created." }
        format.json { render :show, status: :created, location: @postal_code }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @postal_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postal_codes/1 or /postal_codes/1.json
  def update
    respond_to do |format|
      if @postal_code.update(postal_code_params)
        format.html { redirect_to postal_code_url(@postal_code), notice: "Postal code was successfully updated." }
        format.json { render :show, status: :ok, location: @postal_code }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @postal_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postal_codes/1 or /postal_codes/1.json
  def destroy
    @postal_code.destroy

    respond_to do |format|
      format.html { redirect_to postal_codes_url, notice: "Postal code was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postal_code
      @postal_code = PostalCode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def postal_code_params
      params.require(:postal_code).permit(:postal_code, :state, :country, :longitude, :latitude, :city)
    end
end
