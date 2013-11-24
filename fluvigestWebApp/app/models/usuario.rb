class Usuario < ActiveRecord::Base
has_many :lecturas, :foreign_key => 'usuarios_id'
end
