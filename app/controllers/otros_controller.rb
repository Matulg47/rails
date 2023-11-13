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
    @opciones = (1..10).to_a
    @precios=Precio.all
  end

  # GET /otros/1/edit
  def edit
  end

  # POST /otros or /otros.json
  def create
    @cantidades= Array.new()#aca asigno las cantidades que obtuve de los 12 parametros
    @cantidades.push(params[:cantidadBLFRC].to_i, params[:cantidadBLFRG].to_i, 
    params[:cantidadBBCNC].to_i, params[:cantidadBBCNG].to_i, 
    params[:cantidadBVCC].to_i, params[:cantidadBVCCG].to_i, 
    params[:cantidadBLC].to_i, params[:cantidadBLG].to_i, 
    params[:cantidadBBDL].to_i, params[:cantidadBBDLG].to_i,
    params[:cantidadSC].to_i,params[:cantidadSG].to_i,
    params[:cantidadB].to_i,
    params[:cantidadBO].to_i,
    params[:cantidadBN].to_i)
    indice= 1
    @otro=Otro.new
    @pedido=Pedido.find(params[:pedido_id])
    @otros=@pedido.otros
    @cantidades.each do |cantidad|
        if(cantidad > 0)
            puts indice
            @otro=Otro.new()
            if(indice<3)
                @otro.nombre= "Budín de Limón y Frutos Rojos"
            end
            if(indice>2 && indice<5)
                @otro.nombre= "Budín de Banana, Chocolate y Nueces"
            end
            if(indice>4 && indice<7)
                @otro.nombre= "Budín de Vainilla y Chips de Chocolate"
            end
            if(indice>6 && indice<9)
                @otro.nombre= "Budín de Limón"
            end
            if(indice>8 && indice<11)
                @otro.nombre= "Budín de Banana y Dulce de Leche"
            end
            if(indice>10 && indice<13)
                @otro.nombre= "Streusel Ula Hua"
            end
            if(indice==13 )
                @otro.nombre= "Brownie"
            end
            if(indice==14 )
              @otro.nombre= "Brownie con Oreos"
            end
            if(indice==15 )
              @otro.nombre= "Brownie con Nueces"
            end
            if(indice==1 || indice==3 || indice==5 || indice==7 || indice==9 || indice==11 || indice==13|| indice==14|| indice==15)
                @otro.tamaño="Chica"
            end
            if(indice==2 || indice==4 || indice==6 || indice==8 || indice==10 || indice==12)
                @otro.tamaño="Grande"
            end
            
            @otro.cantidad=cantidad
            @otro_en=Otro.find_by(nombre: @otro.nombre, tamaño: @otro.tamaño, pedido_id: params[:pedido_id])
            if @otro_en
                @otro_en.cantidad+=@otro.cantidad
                if @otro_en.update(cantidad: @otro_en.cantidad)
                    
                else
                    flash[:error]=" hubo un error al cargar el pedido en la BD"
                    render :new #con este vuelve al formulario sin perder la informaciòn cargada
                end
            else
                
                @otro.pedido_id= params[:pedido_id]
                if @otro.save         
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
    
    @otro.pedido_id= params[:pedido_id]
    if (params[:cont])
        puts 'PROBANDOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'
        redirect_to new_pedido_path(pedido_id: params[:pedido_id]), notice: "Continuar"           
    end
    if (params[:fin]) 
        redirect_to pedido_path(id: params[:pedido_id]), notice: "Finalizando pedido"         
        
        
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
