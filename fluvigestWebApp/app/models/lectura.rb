class Lectura < ActiveRecord::Base

belongs_to :usuario



validates_presence_of :fecha
validates_presence_of :tincidencias_id
validates_presence_of :usuarios_id
validates_presence_of :contadores_id
#validates_format_of :lectura, :with =>/\A\d+\.?\d*\Z/
validates :lectura, numericality: true
validates :lectura_anterior, numericality: true
validates :usuarios_id, numericality: { only_integer: true }
validates :contadores_id, numericality: {only_integer: true}




end
