class TartaController < ApplicationController
  before_action :set_tartum, only: %i[ show edit update destroy ]

  # GET /tarta or /tarta.json
  def index
    @tarta = Tartum.all
  end

  # GET /tarta/1 or /tarta/1.json
  def show
  end

  # GET /tarta/new
  def new
    @tarta = Tartum.new
    @opciones = (1..10).to_a

  end

  # GET /tarta/1/edit
  def edit
  end

  # POST /tarta or /tarta.json
  def create
    @tarta = Tartum.new(tartum_params)

    respond_to do |format|
      if @tarta.save
        format.html { redirect_to tartum_url(@tarta), notice: "Tartum was successfully created." }
        format.json { render :show, status: :created, location: @tarta }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tartum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarta/1 or /tarta/1.json
  def update
    respond_to do |format|
      if @tarta.update(tartum_params)
        format.html { redirect_to tartum_url(@tarta), notice: "Tartum was successfully updated." }
        format.json { render :show, status: :ok, location: @tarta}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tarta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarta/1 or /tarta/1.json
  def destroy
    @tarta.destroy

    respond_to do |format|
      format.html { redirect_to tarta_url, notice: "Tartum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tartum
      @tarta = Tartum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tartum_params
      params.require(:tartum).permit(:nombre, :tamaño, :precio, :descripcion, :pedido_id)
    end
end
