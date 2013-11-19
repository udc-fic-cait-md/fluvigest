class TipoTarifas < ActiveRecord::Base
  has_many :tarifases, dependent: :destroy
end
