class Pedido < ApplicationRecord
    has_many :cakes
    has_many :tarts
    has_many :desayunos
end
