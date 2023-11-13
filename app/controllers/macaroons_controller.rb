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
    @opciones = (1..10).to_a
    @precios=Precio.all
    
  end

  # GET /macaroons/1/edit
  def edit
  end

  # POST /macaroons or /macaroons.json
  def create
    
    @cantidades= Array.new()#aca asigno las cantidades que obtuve de los 12 parametros
    @cantidades.push(params[:cantidadCVCC].to_i, params[:cantidadCVCCM].to_i, params[:cantidadCVCCG].
    to_i, params[:cantidadCLA].to_i, params[:cantidadCLAM].to_i, params[:cantidadCLAG].to_i, 
    params[:cantidadCCCCB].to_i, params[:cantidadCCCCBM].to_i, params[:cantidadCCCCBG].to_i, 
    params[:cantidadAM].to_i,  params[:cantidadAMG].to_i, 
    params[:cantidadM].to_i, params[:cantidadMM].to_i,
    params[:cantidadC].to_i,)
    indice= 1
    @macaron=Macaroon.new
    @pedido=Pedido.find(params[:pedido_id])
    @macarons=@pedido.macaroons
    @cantidades.each do |cantidad|
        if(cantidad > 0)
            puts indice
            @macaron=Macaroon.new()
            if(indice<4)
                @macaron.nombre= "Cookies de Vainilla y Chips de Chocolate"
            end
            if(indice>3 && indice<7)
                @macaron.nombre= "Cookies de Limón y Almendras"
            end
            if(indice>6 && indice<10)
                @macaron.nombre= "Cookies de Chocolate y Chips de Chocolate Blanco"
            end
            if(indice>9 && indice<12)
                @macaron.nombre= "Alfajor de Maicena"
            end
            if(indice>11 && indice<14)
                @macaron.nombre= "Macaron"
            end
            if(indice>13)
                @macaron.nombre= "Chipá"
            end
            if(indice==1 || indice==4 || indice==7 || indice==10 || indice==12 || indice==14)
                @macaron.tamaño="Chica"
            end
            if(indice==2 || indice==5 || indice==8 || indice==13)
                @macaron.tamaño="Mediano"
            end
            if(indice==3 || indice==6 || indice==9 || indice==11)
                @macaron.tamaño="Grande"
            end
            @macaron.cantidad=cantidad
            
            @macaron_en=Macaroon.find_by(nombre: @macaron.nombre, tamaño: @macaron.tamaño, pedido_id: params[:pedido_id])
            if @macaron_en
               
                @macaron_en.cantidad+=@macaron.cantidad
                if @macaron_en.update(cantidad: @macaron_en.cantidad)
                    
                else
                    flash[:error]=" hubo un error al cargar el pedido en la BD"
                    render :new #con este vuelve al formulario sin perder la informaciòn cargada
                end
            else
                
                @macaron.pedido_id= params[:pedido_id]
                if @macaron.save         
                else
                    flash[:error]=" hubo un error al cargar el pedido en la BD"
                    render :new #con este vuelve al formulario sin perder la informaciòn cargada
                end
            end
        end
        indice=indice+1
    end

   
    #(torta_params)
    #crear una torta en la BD
    #@torta.pedido_id= params[:pedido_id]
    
    @macaron.pedido_id= params[:pedido_id]
    if (params[:cont])
        puts 'PROBANDOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'
        redirect_to new_pedido_path(pedido_id: params[:pedido_id]), notice: "Continuar"           
    end
    if (params[:fin]) 
        redirect_to pedido_path(id: params[:pedido_id]), notice: "Finalizando pedido"         
        
        
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
