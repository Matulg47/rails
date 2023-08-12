json.extract! desayuno, :id, :nombre, :tamaño, :precio, :descripcion, :pedido_id, :created_at, :updated_at
json.url desayuno_url(desayuno, format: :json)
