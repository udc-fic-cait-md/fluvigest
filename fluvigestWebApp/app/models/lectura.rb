class Lectura < ActiveRecord::Base

belongs_to :usuario, :foreign_key => 'usuarios_id'
belongs_to :contadore, :foreign_key => 'contadores_id'

validates_presence_of :fecha
validates_presence_of :tincidencias_id
validates_presence_of :usuarios_id
validates_presence_of :contadores_id
#validates_format_of :lectura, :with =>/\A\d+\.?\d*\Z/
validates :lectura, numericality: true
validates :lectura_anterior, numericality: true
validates :usuarios_id, numericality: { only_integer: true }
validates :contadores_id, numericality: {only_integer: true}

validate :existe_usuario_id
validate :existe_contador_id

  def existe_usuario_id
    
 begin
Usuario.find(self.usuarios_id)
rescue ActiveRecord::RecordNotFound
errors.add(:usuario_id, 'no existe este usuario')
end


def existe_contador_id
  
Contadore.find(self.contadores_id)
rescue ActiveRecord::RecordNotFound
errors.add(:contadore_id, 'no existe este contador')
  
end
      
      
    end
  



end
