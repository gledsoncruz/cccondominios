class UnidadePessoa < ActiveRecord::Base

  belongs_to :unidade
  belongs_to :pessoa

end
