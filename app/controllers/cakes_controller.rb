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
            @opciones = (1..10).to_a
            
            
        end
    
        #POST /cakes
        def create 
            @cantidades= Array.new()#aca asigno las cantidades que obtuve de los 12 parametros
            @cantidades.push(params[:cantidadMFRC].to_i, params[:cantidadMFRM].to_i, params[:cantidadMFRG].
            to_i, params[:cantidadMOC].to_i, params[:cantidadMOM].to_i, params[:cantidadMOG].to_i, 
            params[:cantidadMPC].to_i, params[:cantidadMPM].to_i, params[:cantidadMPG].to_i, 
            params[:cantidadCFRC].to_i, params[:cantidadCFRM].to_i, params[:cantidadCFRG].to_i, 
            params[:cantidadCC].to_i, params[:cantidadCM].to_i,params[:cantidadCG].to_i,
            params[:cantidadFC].to_i,params[:cantidadFM].to_i,params[:cantidadFG].to_i,
            params[:rogelC].to_i,params[:rogelM].to_i,params[:rogelG].to_i)
            indice= 1
            @torta=Cake.new
            @pedido=Pedido.find(params[:pedido_id])
            @tortas=@pedido.cakes
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
                    if(indice>9 && indice<13)
                        @torta.nombre= "Cheesecake Frutos Rojos"
                    end
                    if(indice>12 && indice<16)
                        @torta.nombre= "Marquise Clásica"
                    end
                    if(indice>15 && indice<19)
                        @torta.nombre= "Marquise Ferrero"
                    end
                    if(indice>18 )
                        @torta.nombre= "Rogel"
                    end
                    if(indice==1 || indice==4 || indice==7 || indice==10 || indice==13 || indice==16 || indice==19)
                        @torta.tamaño="Chica"
                    end
                    if(indice==2 || indice==5 || indice==8 || indice==11 || indice==14 || indice==17 || indice==20)
                        @torta.tamaño="Mediano"
                    end
                    if(indice==3 || indice==6 || indice==9 || indice==12 || indice==15 || indice==18 || indice==21)
                        @torta.tamaño="Grande"
                    end
                    @torta.cantidad=cantidad
                    @torta_en=Cake.find_by(nombre: @torta.nombre, tamaño: @torta.tamaño, pedido_id: params[:pedido_id])
                    if @torta_en
                        puts @torta_en
                        puts 'wtffffffffffffffffffffff'
                        @torta_en.cantidad+=@torta.cantidad
                        if @torta_en.update(cantidad: @torta_en.cantidad)
                            
                        else
                            flash[:error]=" hubo un error al cargar el pedido en la BD"
                            render :new #con este vuelve al formulario sin perder la informaciòn cargada
                        end
                    else
                        
                        @torta.pedido_id= params[:pedido_id]
                        if @torta.save         
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
            
            @torta.pedido_id= params[:pedido_id]
            if (params[:cont])
                puts 'PROBANDOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'
                redirect_to new_pedido_path(pedido_id: params[:pedido_id]), notice: "Continuar"           
            end
            if (params[:fin]) 
                redirect_to pedido_path(id: params[:pedido_id]), notice: "Finalizando pedido"         
                
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
