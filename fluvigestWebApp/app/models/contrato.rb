class Contrato < ActiveRecord::Base
  belongs_to :abonado
  belongs_to :tipo_forma_pagos
end
