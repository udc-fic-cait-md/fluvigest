class Inmueble < ActiveRecord::Base
	has_many :contadore
	belongs_to :calle

	validates_presence_of :numero
	validates_presence_of :orden
	validates_presence_of :cod_postal

	validates :orden, uniqueness: true

	def self.siguiente_orden
		maximo = Inmueble.maximum("orden")
		if maximo == nil
			return 1
		else
			return maximo +1 
		end
	end
end
