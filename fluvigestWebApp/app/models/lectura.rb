class Lectura < ActiveRecord::Base

belongs_to :usuario


validates_presence_of :lectura
validates_presence_of :fecha
validates_presence_of :incidencia
validates_presence_of :tincidencias_id
validates_presence_of :usuarios_id
validates_presence_of :contadores_id
end
