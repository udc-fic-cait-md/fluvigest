class Calle < ActiveRecord::Base
	belongs_to :barrio
	has_many :inmueble
end
