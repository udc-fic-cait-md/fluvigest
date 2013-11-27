class TipoTarifa < ActiveRecord::Base
  has_many :tarifas, dependent: :destroy
  belongs_to :tipo_servicio
end
