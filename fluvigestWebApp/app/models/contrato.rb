class Contrato < ActiveRecord::Base
  belongs_to :abonados
  belongs_to :tipo_forma_pagos
end
