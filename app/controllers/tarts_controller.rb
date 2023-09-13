class TartsController < ApplicationController
  before_action :set_tartum, only: %i[ show edit update destroy ]

  # GET /tart or /tart.json
  def index
    @tarta = Tart.all
  end

  # GET /tart/1 or /tart/1.json
  def show
  end

  # GET /tart/new
  def new
    @tarta = Tart.new
    @opciones = (1..10).to_a

  end

  # GET /tart/1/edit
  def edit
  end

  # POST /tart or /tart.json
  def create
    @tarta = Tart.new()

    @cantidades= Array.new()#aca asigno las cantidades que obtuve de los 12 parametros
    @cantidades.push( params[:cantidadLPM].to_i, params[:cantidadLPG].to_i, 
            params[:cantidadTTM].to_i, params[:cantidadTTG].to_i, 
            params[:cantidadCMM].to_i, params[:cantidadCMG].to_i, 
            params[:cantidadTCM].to_i, params[:cantidadTCG].to_i, 
            params[:cantidadTOM].to_i,params[:cantidadTOG].to_i,
            params[:cantidadRM].to_i,params[:cantidadRG].to_i,
            params[:cantidadTRFM].to_i,params[:cantidadTRFG].to_i,
            params[:cantidadPFM].to_i,params[:cantidadPFG].to_i,
            params[:cantidadTMF].to_i)
    indice= 1
    @tarta=Tart.new
    @pedido=Pedido.find(params[:pedido_id])
    @tartas=@pedido.tarts
    @cantidades.each do |cantidad|
      if(cantidad > 0)
        puts indice
        @tarta=Tart.new()
        if(indice<3)
          @tarta.nombre= "Lemon Pie"
        end
        if(indice>2 && indice<5)
          @tarta.nombre= "Tarta Tofi"
        end
        if(indice>4 && indice<7)
          @tarta.nombre= "Crumble de Manzana"
        end
        if(indice>6 && indice<9)
            @tarta.nombre= "Tarta de Coco"
        end
        if(indice>8 && indice<11)
            @tarta.nombre= "Tarta Tofi con Oreos"
        end
        if(indice>10 && indice<13)
            @tarta.nombre= "Tarta de Ricota"
        end
        if(indice>12 && indice<15)
            @tarta.nombre= "Tarta de Ricota y Frambuesas"
        end
        if(indice>14 && indice<17)
            @tarta.nombre= "Pasta Frolla de Membrillo o Batata"
        end
        if(indice>16 )
            @tarta.nombre= "Tarta de Maracuyá y Frambuesa"
        end
        if(indice==1 || indice==3 || indice==5 || indice==7 || indice==9 || indice==11 || indice==13 || indice==15|| indice==17)
            @tarta.tamaño="Mediano"
        end
        if(indice==2 || indice==4 || indice==6 || indice==8 || indice==10 || indice==12 || indice==14 || indice==16)
            @tarta.tamaño="Grande"
        end
        puts 'PROBANDOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'
        @tarta.cantidad=cantidad
        @tarta_en=Tart.find_by(nombre: @tarta.nombre, tamaño: @tarta.tamaño)
        if @tarta_en
            puts @tarta_en
            @tarta_en.cantidad += @tarta.cantidad
            if @tarta_en.update(cantidad: @tarta_en.cantidad)
                
            else
                flash[:error]=" hubo un error al cargar el pedido en la BD"
                render :new #con este vuelve al formulario sin perder la informaciòn cargada
            end
        else
            
            @tarta.pedido_id= params[:pedido_id]
            if @tarta.save         
            else
                flash[:error]=" hubo un error al cargar el pedido en la BD"
                render :new #con este vuelve al formulario sin perder la informaciòn cargada
            end
        end
      end
      indice=indice+1
    end
    @tarta.pedido_id= params[:pedido_id]
    if (params[:cont])
        
        redirect_to new_pedido_path(pedido_id: params[:pedido_id]), notice: "Continuar"           
    end
    if (params[:fin]) 
        redirect_to pedido_path(id: params[:pedido_id]), notice: "Finalizando pedido"         
        
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
