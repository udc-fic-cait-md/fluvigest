class Lectura < ActiveRecord::Base


belongs_to :contadore, :foreign_key => 'contadores_id'

validates_presence_of :fecha
validates_presence_of :tipo_incidencias_id
validates_presence_of :usuarios_id
validates_presence_of :contadores_id
#validates_format_of :lectura, :with =>/\A\d+\.?\d*\Z/
validates :lectura, numericality: true
validates :lectura_anterior, numericality: true

validates :contadores_id, numericality: {only_integer: true}


validate :existe_contador_id

  


def existe_contador_id
  
Contadore.find(self.contadores_id)
rescue ActiveRecord::RecordNotFound
errors.add(:contadore_id, 'no existe este contador')
  
end
      
      
   
  



end
