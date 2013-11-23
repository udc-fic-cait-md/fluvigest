class ModelosContadore < ActiveRecord::Base
	has_many :contadore

	validates_presence_of :marca
	validates_presence_of :modelo
end
