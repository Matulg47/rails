class PreciosController < ApplicationController
  before_action :set_precio, only: %i[ show edit update destroy ]
 
  

  # GET /precios or /precios.json
  def index
     if params[:val]=="si"
    
      @precios = Precio.order(:nombre)
      
      else
        @error_message = "Credenciales incorrectas. Por favor, verifica tu nombre y contraseña."
        
        render 'admin' 
      end
   
  end
  def admin
    if request.post?
      put
    end
  end
  # POST /admin 
 def identificando
  if params[:nombre]=="cami" && params[:contrasena] =="123"
    
    redirect_to '/precios?val=si'
  else
    @error_message = "Credenciales incorrectas. Por favor, verifica tu nombre y contraseña."
    
    redirect_to '/admin' 
  end
end
  # GET /precios/1 or /precios/1.json
  def show
    @precios=Precio.all
  end

  # GET /precios/new
  def new
    @precio = Precio.new
  end

  # GET /precios/1/edit
  def edit
  
  end

  # POST /precios or /precios.json
  def create
    @precio = Precio.new(precio_params)

    respond_to do |format|
      if @precio.save
        format.html { redirect_to precio_url(@precio), notice: "Precio was successfully created." }
        format.json { render :show, status: :created, location: @precio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @precio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /precios/1 or /precios/1.json
  def update
    @precio = Precio.find(params[:id])

    @precio.update(params.require(:precio).permit(:nombre,:precioC,:precioM,:precioG))
    puts 'HOLAAAAAAAAAAAAAAA'
    if @precio.save
      redirect_to edit_precio_path(@precio), notice: '¡El precio se ha actualizado!'
    else
      render :edit
    end
  end

  # DELETE /precios/1 or /precios/1.json
  def destroy
    @precio.destroy

    respond_to do |format|
      format.html { redirect_to precios_url, notice: "Precio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_precio
      @precio = Precio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def precio_params
      params.fetch(:precio, {})
    end
end
