class OtrosController < ApplicationController
  before_action :set_otro, only: %i[ show edit update destroy ]

  # GET /otros or /otros.json
  def index
    @otros = Otro.all
  end

  # GET /otros/1 or /otros/1.json
  def show
  end

  # GET /otros/new
  def new
    @otro = Otro.new
  end

  # GET /otros/1/edit
  def edit
  end

  # POST /otros or /otros.json
  def create
    @otro = Otro.new(otro_params)

    respond_to do |format|
      if @otro.save
        format.html { redirect_to otro_url(@otro), notice: "Otro was successfully created." }
        format.json { render :show, status: :created, location: @otro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @otro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /otros/1 or /otros/1.json
  def update
    respond_to do |format|
      if @otro.update(otro_params)
        format.html { redirect_to otro_url(@otro), notice: "Otro was successfully updated." }
        format.json { render :show, status: :ok, location: @otro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @otro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /otros/1 or /otros/1.json
  def destroy
    @otro.destroy

    respond_to do |format|
      format.html { redirect_to otros_url, notice: "Otro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_otro
      @otro = Otro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def otro_params
      params.require(:otro).permit(:tamaño, :nombre, :precio, :descripcion, :pedido_id)
    end
end
