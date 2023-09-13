class PedidosController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        #listar pedidos
        @pedidos= Pedido.all 

    end

    def show
        #mostrar datos de un pedido
        @pedido=Pedido.find(params[:id])
        @tortas=@pedido.cakes
        @tartas=@pedido.tarts
        @desayunos=@pedido.desayunos
    end

    def new 
        
        #mostrar formulario de carga de un pedido
        if params[:pedido_id].present?
            
            if params[:pedido_id]=='-1'
                puts 'PEDIDO NUEVOOOO'
                @pedido=Pedido.new
            else
                if(params[:pedido_id])
                    puts 'PEDIDO YA EXISTE'
                    @pedido=Pedido.find(params[:pedido_id])
                end
            end
        end
    end

    # /pedidos POST
    def create 
       
            @pedido=Pedido.new
        
            if(params[:pedido_id])
                puts 'PEDIDO YA EXISTE'
                @pedido=Pedido.find(params[:pedido_id])
            end
       
           
        
        
                  #crear un pedido en la BD
                 # @pedido = Pedido.create(producto: params[:pedido][:producto], descripcion params[:pedido][:descripcion])
                 #otra opcion es: 
                 #@pedido= Pedido.create(params.require(:pedido).permit(:producto, :descripcion))
                 # el .create crea y persiste y el .new crea pero no persisten en la BD hay que agregar un .save
                  puts 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'

                #   if params[:mas_tortas] 
                #       redirect_to new_cake_path(nombre: @pedido.a_nombre_de, pedido_id: @pedido.id), notice: "Se guardo el pedido correctamentee"
                #   end
                #   if params[:tort]

                #   end
                #   if params[:mas_tartas] 
                #       redirect_to new_tart_path(nombre: @pedido.a_nombre_de, pedido_id: @pedido.id), notice: "Se guardo el pedido correctamentee"
                #   end
                #   if params[:mas_desa]
                #       redirect_to new_desayuno_path(nombre: @pedido.a_nombre_de, pedido_id: @pedido.id), notice: "Se guardo el pedido correctamentee"
                #   end
                #   if params[:mas_maca] 
                #       redirect_to new_macaroon_path(nombre: @pedido.a_nombre_de, pedido_id: @pedido.id), notice: "Se guardo el pedido correctamentee"
                #   end
                #   if params[:mas_otros] 
                #       redirect_to new_otro_path(nombre: @pedido.a_nombre_de, pedido_id: @pedido.id), notice: "Se guardo el pedido correctamentee"
                #   end
                # end
    
        if @pedido.save
            # && @pedido.fecha_de_entrega >= (Date.today + 2)
            # if @pedido.fecha_de_entrega.strftime("%A") == "Monday"
            #     redirect_to new_cake_path(nombre: @pedido.a_nombre_de, pedido_id: @pedido.id), notice: "Los pedidos se pueden retirar o enviar de martes a domingo, tu pedido va a estar listo el martes"
            #     @pedido.fecha_de_entrega+=1
            #     @pedido.save
            # else
                if params[:mas_tortas] 
                    redirect_to new_cake_path(pedido_id: @pedido.id), notice: "Se guardo el pedido correctamentee"
                end
                if params[:tort]
                    
                end
                if params[:mas_tartas] 
                    redirect_to new_tart_path(nombre: @pedido.a_nombre_de, pedido_id: @pedido.id), notice: "Se guardo el pedido correctamentee"
                end
                if params[:mas_desa]
                    redirect_to new_desayuno_path(nombre: @pedido.a_nombre_de, pedido_id: @pedido.id), notice: "Se guardo el pedido correctamentee"
                end
                if params[:mas_maca] 
                    redirect_to new_macaroon_path(nombre: @pedido.a_nombre_de, pedido_id: @pedido.id), notice: "Se guardo el pedido correctamentee"
                end
                if params[:mas_otros] 
                    redirect_to new_otro_path(nombre: @pedido.a_nombre_de, pedido_id: @pedido.id), notice: "Se guardo el pedido correctamentee"
                end
                
            #end
        else
        # if @pedido.fecha_de_entrega < (Date.today + 2)
        #     flash[:error]="Los pedidos son con un mìnimo de 48hs"
        #     redirect_to new_pedido_path
        # else
            flash[:error]=" hubo un error al cargar el pedido en la BD"
            render :new
        end
           
       
    end
    def edit
        #mostrar formulario de edicion de un pedido
    end
    def update
        #modificar los datos de un pedido en la BD
        put 'HOLAAAAAAAAAAAAAAAAAAAA'
    end
    def destroy
        #eliminar un pedido?
    end  
    def pedido_params
        params.require(:pedido).permit(:producto, :a_nombre_de, :fecha_de_entrega )
      end  

    def continuar
        @pedidos = Pedidos.find(params[:pedido_id])
    end
end