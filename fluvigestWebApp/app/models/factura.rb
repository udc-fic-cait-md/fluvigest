class Factura < ActiveRecord::Base
  has_many :linea_facturas, dependent: :destroy
  belongs_to :contrato
end
