class Inmueble < ActiveRecord::Base
	has_many :contadore
	belongs_to :calle
end
