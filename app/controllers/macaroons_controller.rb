class MacaroonsController < ApplicationController
  before_action :set_macaroon, only: %i[ show edit update destroy ]

  # GET /macaroons or /macaroons.json
  def index
    @macaroons = Macaroon.all
  end

  # GET /macaroons/1 or /macaroons/1.json
  def show
  end

  # GET /macaroons/new
  def new
    @macaroon = Macaroon.new
  end

  # GET /macaroons/1/edit
  def edit
  end

  # POST /macaroons or /macaroons.json
  def create
    @macaroon = Macaroon.new(macaroon_params)

    respond_to do |format|
      if @macaroon.save
        format.html { redirect_to macaroon_url(@macaroon), notice: "Macaroon was successfully created." }
        format.json { render :show, status: :created, location: @macaroon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @macaroon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /macaroons/1 or /macaroons/1.json
  def update
    respond_to do |format|
      if @macaroon.update(macaroon_params)
        format.html { redirect_to macaroon_url(@macaroon), notice: "Macaroon was successfully updated." }
        format.json { render :show, status: :ok, location: @macaroon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @macaroon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /macaroons/1 or /macaroons/1.json
  def destroy
    @macaroon.destroy

    respond_to do |format|
      format.html { redirect_to macaroons_url, notice: "Macaroon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_macaroon
      @macaroon = Macaroon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def macaroon_params
      params.require(:macaroon).permit(:nombre, :tamaño, :precio, :descripcion, :pedido_id)
    end
end
