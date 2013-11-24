class Abonado < ActiveRecord::Base
    has_many :contratos
    validates :nombre, presence: true,
    length: { minimum: 3 }
    validates :apellidos, presence: true,
    length: { minimum: 5 }
end
