class Bloco < ActiveRecord::Base
  belongs_to :condominio
  has_many :unidades, :dependent => :destroy

  validates :descricao, :sigla, presence: true
end
