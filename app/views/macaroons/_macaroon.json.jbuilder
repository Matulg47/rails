json.extract! macaroon, :id, :nombre, :tamaño, :precio, :descripcion, :pedido_id, :created_at, :updated_at
json.url macaroon_url(macaroon, format: :json)
