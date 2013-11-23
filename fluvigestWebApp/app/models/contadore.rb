class Contadore < ActiveRecord::Base
	has_one :modelos_contadore
	belongs_to :inmueble
end
