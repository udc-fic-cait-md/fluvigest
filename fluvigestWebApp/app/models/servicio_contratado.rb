class ServicioContratado < ActiveRecord::Base
  belongs_to :contrato
  belongs_to :tipo_servicio
  belongs_to :tipo_tarifa
end
