class Pessoa < ActiveRecord::Base
  has_many :unidade_pessoas
  has_many :unidades, :through => :unidade_pessoas, :dependent => :destroy

end
