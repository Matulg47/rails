class DesayunosController < ApplicationController
  before_action :set_desayuno, only: %i[ show edit update destroy ]

  # GET /desayunos or /desayunos.json
  def index
    @desayunos = Desayuno.all
  end

  # GET /desayunos/1 or /desayunos/1.json
  def show
  end

  # GET /desayunos/new
  def new
    @desayuno = Desayuno.new
  end

  # GET /desayunos/1/edit
  def edit
  end

  # POST /desayunos or /desayunos.json
  def create
    @desayuno = Desayuno.new(desayuno_params)

    respond_to do |format|
      if @desayuno.save
        format.html { redirect_to desayuno_url(@desayuno), notice: "Desayuno was successfully created." }
        format.json { render :show, status: :created, location: @desayuno }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @desayuno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desayunos/1 or /desayunos/1.json
  def update
    respond_to do |format|
      if @desayuno.update(desayuno_params)
        format.html { redirect_to desayuno_url(@desayuno), notice: "Desayuno was successfully updated." }
        format.json { render :show, status: :ok, location: @desayuno }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @desayuno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desayunos/1 or /desayunos/1.json
  def destroy
    @desayuno.destroy

    respond_to do |format|
      format.html { redirect_to desayunos_url, notice: "Desayuno was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desayuno
      @desayuno = Desayuno.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def desayuno_params
      params.require(:desayuno).permit(:nombre, :tamaño, :precio, :descripcion, :pedido_id)
    end
end
