class Contadore < ActiveRecord::Base
	belongs_to :modelos_contadore
	belongs_to :inmueble

	validates_presence_of :num_serie
	validates_presence_of :calibre

end
