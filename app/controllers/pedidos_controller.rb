class PedidosController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        #listar pedidos
        @pedidos= Pedido.all 

    end

    def show
        #mostrar datos de un pedido
        
    end

    def new 
        #mostrar formulario de carga de un pedido
        @pedido=Pedido.new
    end

    # /pedidos POST
    def create 
        @pedido=Pedido.new(pedido_params)
        #crear un pedido en la BD
       # @pedido = Pedido.create(producto: params[:pedido][:producto], descripcion params[:pedido][:descripcion])
       #otra opcion es: 
       #@pedido= Pedido.create(params.require(:pedido).permit(:producto, :descripcion))
       # el .create crea y persiste y el .new crea pero no persisten en la BD hay que agregar un .save
        puts 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
       

          
       if @pedido.save && @pedido.fecha_de_entrega >= (Date.today + 2)
            if @pedido.fecha_de_entrega.strftime("%A") == "Monday"
                redirect_to new_cake_path(parametro1: @pedido.a_nombre_de), notice: "Los pedidos se pueden retirar o enviar de martes a domingo, tu pedido va a estar listo el martes"
                @pedido.fecha_de_entrega+=1
                @pedido.save
            else
                redirect_to new_cake_path(parametro1: @pedido.a_nombre_de), notice: "Se guardo el pedido correctamentee"
            end
       else
        if @pedido.fecha_de_entrega < (Date.today + 2)
            flash[:error]="Los pedidos son con un mìnimo de 48hs"
        else
            flash[:error]=" hubo un error al cargar el pedido en la BD"
        end
            render :new #con este vuelve al formulario sin perder la informaciòn cargada
       end
    end
    def edit
        #mostrar formulario de edicion de un pedido
    end
    def update
        #modificar los datos de un pedido en la BD
    end
    def destroy
        #eliminar un pedido?
    end  
    def pedido_params
        params.require(:pedido).permit(:producto, :a_nombre_de, :fecha_de_entrega )
      end  
end