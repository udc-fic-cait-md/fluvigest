class Factura < ActiveRecord::Base
  has_many :linea_facturas, dependent: :destroy
end
