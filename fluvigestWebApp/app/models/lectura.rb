class Lectura < ActiveRecord::Base
validates_presence_of :lectura
validates_presence_of :incidencia
validates_presence_of :tincidencias_id
validates_presence_of :usuarios_id
validates_presence_of :contadores_id
end
