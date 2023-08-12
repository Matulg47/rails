class CakesController < ApplicationController
        def index
            #listar tortas
            @tortas= Cake.all 
    
        end
    
        def show
            #mostrar datos de una torta
            @torta=Cake.find(params[:id])
        end
    
        def new 
            #mostrar formulario de carga de una torta
          
            @torta=Cake.new
            puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
            @opciones = (1..10).to_a
            
        end
    
        #POST /tortas
        def create 
            @cantidades= Array.new()#aca asigno las cantidades que obtuve de los 12 parametros
            @cantidades.push(params[:cantidadMFRC].to_i, params[:cantidadMFRM].to_i, params[:cantidadMFRG].to_i, params[:cantidadMOC].to_i, params[:cantidadMOM].to_i,
            params[:cantidadMOG].to_i, params[:cantidadMPC].to_i, params[:cantidadMPM].to_i, params[:cantidadMPG].to_i, params[:cantidadCFRC].to_i, params[:cantidadCFRM].to_i, params[:cantidadCFRG].to_i)
            indice= 1
            @cantidades.each do |cantidad|
                if(cantidad > 0)
                    puts indice
                    @torta=Cake.new()
                    if(indice<4)
                        @torta.nombre= "Marquise Frutos Rojos"
                    end
                    if(indice>3 && indice<7)
                        @torta.nombre= "Marquise Oreo"
                    end
                    if(indice>6 && indice<10)
                        @torta.nombre= "Marquise Praline"
                    end
                    if(indice>9)
                        @torta.nombre= "Cheesecake Frutos Rojos"
                    end
                    if(indice==1 || indice==4 || indice==7 || indice==10)
                        @torta.tamaño="Chica"
                    end
                    if(indice==2 || indice==5 || indice==8 || indice==11)
                        @torta.tamaño="Mediano"
                    end
                    if(indice==3 || indice==6 || indice==9 || indice==12)
                        @torta.tamaño="Grande"
                    end

                    @torta.cantidad=cantidad
                    @torta.pedido_id= params[:pedido_id]
                    if @torta.save 
                        redirect_to new_pedido_path(pedido_id: @pedido.id), notice: "Continuar"
                          
                    else
                        flash[:error]=" hubo un error al cargar el pedido en la BD"
                
                        render :new #con este vuelve al formulario sin perder la informaciòn cargada
                    end

                end
                indice=indice+1
            end

            if (params[:cantidadCFRG]=="2") #funcionò
                puts "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
    
            end
           # @torta=Cake.new()
            puts "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    
            #(torta_params)
            #crear una torta en la BD
            #@torta.pedido_id= params[:pedido_id]
            @torta=Cake.new()
            @torta.pedido_id= params[:pedido_id]
            if @torta.save 
                    redirect_to new_pedido_path(pedido_id: params[:pedido_id]), notice: "Continuar"
            
                        
            else
                flash[:error]=" hubo un error al cargar el pedido en la BD"
            
                render :new #con este vuelve al formulario sin perder la informaciòn cargada
           end
        end
        
        def edit
            #mostrar formulario de edicion de una torta
        end
        def update
            #modificar los datos de una torta en la BD
        end
        def destroy
            #eliminar una torta?
        end  
        def torta_params #arreglar params
          #  params.require(:torta).permit(:producto, :a_nombre_de, :fecha_de_entrega )
        end  
    end
