class Unidade < ActiveRecord::Base
  belongs_to :bloco
  has_many :unidade_pessoas
  has_many :pessoas, through: :unidade_pessoas, :dependent => :destroy

  validates :numero, :piso, presence: true
end
